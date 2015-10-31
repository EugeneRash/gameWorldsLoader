//
//  XYNetworkManager.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYUser;
typedef void(^XYNetworkManagerSuccessBlock)(NSData *data);
typedef void(^XYNetworkManagerFailureBlock)(NSError *error);

@interface XYNetworkManager : NSObject
+ (instancetype)sharedManager;
- (void)loadWorldsWithUser:(XYUser *)user withSuccess:(XYNetworkManagerSuccessBlock)successBlock failure:(XYNetworkManagerFailureBlock)failureBlock;

@end
