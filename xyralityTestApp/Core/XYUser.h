//
//  XYUser.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYUser : NSObject

@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) NSString *deviceType;
@property (nonatomic, strong) NSString *deviceId;

- (instancetype)initWithLogin:(NSString *)login password:(NSString *)password;
- (NSData *)mapUserData;

@end
