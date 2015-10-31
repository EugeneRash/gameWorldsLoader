//
//  XYDataManager.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYDataManager.h"
#import "XYNetworkManager.h"

@interface XYDataManager ();
@property (nonatomic, strong) NSArray *loadedWorlds;
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

    }
    return self;
}

- (void)getAvailableWorldsForUser:(XYUser *)user withSuccess:(XYLoadWorldsSuccessBlock)successBlock failureBlock:(XYLoadWorldsFailureBlock)failureBlock {

    __weak typeof(self) weakSelf = self;
    [[XYNetworkManager sharedManager] loadWorldsWithUser:user withSuccess:^(NSDictionary *result) {

        typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf == nil) {
            return;
        }
        
        if (![strongSelf parseServerResponse:result]) {
            NSDictionary *details = @{NSLocalizedDescriptionKey : NSLocalizedString(@"Can't load game worlds. Server returned empty data", nil), NSLocalizedFailureReasonErrorKey : @""};
            NSError *error = [NSError errorWithDomain:@"com.test.xyralityTestApp" code:500 userInfo:details];
            failureBlock(error);

        }
        
    } failure:^(NSError *error) {
        
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
    

}

- (BOOL)parseServerResponse:(NSDictionary *)response {

    if (response[@"allAvailableWorlds"] && [response[@"allAvailableWorlds"] isKindOfClass:[NSArray class]]) {
        
        NSArray *allAvailableWorlds = [response[@"allAvailableWorlds"] copy];
        if (allAvailableWorlds.count > 0) {
            
        }
        
        
//        self.loadedWorlds = result[@"allAvailableWorlds"];
    }
    
    return YES;
    
}


@end
