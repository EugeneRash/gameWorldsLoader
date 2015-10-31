//
//  XYNetworkManager.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#define kServerBaseURL @"http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"

#import "XYNetworkManager.h"
#import "XYUser.h"

@interface XYNetworkManager ();
@property (nonatomic, strong) NSURLSession *session;
@end


@implementation XYNetworkManager


+ (instancetype)sharedManager {
    
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] init];
    });
    return shared;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:sessionConfig];

    }
    
    return self;
}


- (void)loadWorldsWithUser:(XYUser *)user withSuccess:(XYNetworkManagerSuccessBlock)successBlock failure:(XYNetworkManagerFailureBlock)failureBlock {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kServerBaseURL]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [user mapUserData];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        NSPropertyListFormat plistFormat;
        NSDictionary *plistResponse = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&plistFormat error:&error];
        
        if (plistResponse[@"error"]) {
            
            if (failureBlock) {
                failureBlock([XYNetworkManager genericError]);
            }
            
            NSLog(@"Error: %@", plistResponse[@"error"]);
            
            return ;
        }
        
        
        if (error) {
            if (failureBlock) {
                failureBlock(error);
            }
        } else if (successBlock) {
            successBlock(plistResponse);
        }
        
        
    }];
    
    
    [dataTask resume];

}

+ (NSError *)genericError {

    NSDictionary *details = @{NSLocalizedDescriptionKey : NSLocalizedString(@"Can't load game worlds. Please check your credentials and internet connection", nil), NSLocalizedFailureReasonErrorKey : @""};
    NSError *error = [NSError errorWithDomain:@"com.test.xyralityTestApp" code:500 userInfo:details];
    
    return error;

}

@end
