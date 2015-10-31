//
//  XYUser.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYUser : NSObject

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *deviceType;
@property (nonatomic, strong) NSString *deviceId;

- (NSData *)mapUserData;

@end
