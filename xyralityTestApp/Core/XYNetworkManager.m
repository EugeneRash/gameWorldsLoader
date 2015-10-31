//
//  XYNetworkManager.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#define kServerBaseURL @"http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"

#import "XYNetworkManager.h"
#import <UIKit/UIKit.h>

@interface XYNetworkManager ();

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSString *deviceType;
@property (nonatomic, strong) NSString *deviceId;

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
        self.deviceType = [NSString stringWithFormat:@"%@ - %@ %@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
        self.deviceId = [[NSUUID UUID] UUIDString];
        
    }
    
    return self;
}


- (void)loadWorldsRequest {



}

@end
