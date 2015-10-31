//
//  XYDataManager.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XYLoadWorldsSuccessBlock)(void(^)());
typedef void(^XYLoadWorldsFailureBlock)(NSError *error);

@class XYUser;
@interface XYDataManager : NSObject

+ (instancetype)sharedManager;
- (void)getAvailableWorldsForUser:(XYUser *)user withSuccess:(XYLoadWorldsSuccessBlock)successBlock failureBlock:(XYLoadWorldsFailureBlock)failureBlock;

@end
