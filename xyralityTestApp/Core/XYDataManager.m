//
//  XYDataManager.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYDataManager.h"

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

    


}



@end
