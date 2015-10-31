//
//  XYDataManager.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYDataManager.h"
#import "XYNetworkManager.h"
#import "XYGameWorld.h"

@interface XYDataManager ();
@property (nonatomic, strong) NSMutableArray *loadedWorlds;
@end



@implementation XYDataManager

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
        self.loadedWorlds = [NSMutableArray array];
    }
    return self;
}

- (void)getAvailableWorldsForUser:(XYUser *)user withSuccess:(XYLoadWorldsSuccessBlock)successBlock failureBlock:(XYLoadWorldsFailureBlock)failureBlock {

    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_queue_create("", DISPATCH_QUEUE_SERIAL), ^{

        [[XYNetworkManager sharedManager] loadWorldsWithUser:user withSuccess:^(NSDictionary *result) {

            typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf == nil) {
                return;
            }
            
            if ([strongSelf parseServerResponse:result]) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    successBlock();
                });
                NSLog(@"Parsing Completed");

            } else {
                NSDictionary *details = @{NSLocalizedDescriptionKey : NSLocalizedString(@"Can't load game worlds. Server returned empty data", nil), NSLocalizedFailureReasonErrorKey : @""};
                NSError *error = [NSError errorWithDomain:@"com.test.xyralityTestApp" code:500 userInfo:details];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    failureBlock(error);
                });
                
                NSLog(@"Error: response parsing failed");
            }
            
        } failure:^(NSError *error) {
            
            if (failureBlock) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failureBlock(error);
                });
            }
            
        }];
        
    });
    

}

- (BOOL)parseServerResponse:(NSDictionary *)response {

    BOOL result = NO;
    if (response[@"allAvailableWorlds"] && [response[@"allAvailableWorlds"] isKindOfClass:[NSArray class]]) {
        
        NSArray *allAvailableWorlds = [response[@"allAvailableWorlds"] copy];
        if (allAvailableWorlds.count > 0) {
            for (NSDictionary *worldData in allAvailableWorlds) {
                [self.loadedWorlds addObject:[[XYGameWorld alloc] initWithResponse:worldData]];
            }
            result = YES;
        }
        
    }
    
    return result;
    
}


@end
