//
//  XYUser.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYUser.h"
#import <UIKit/UIKit.h>


@implementation XYUser

- (instancetype)initWithLogin:(NSString *)login password:(NSString *)password {
    self = [super init];
    if (self) {
        self.login = login;
        self.password = password;
        self.deviceType = [NSString stringWithFormat:@"%@ - %@ %@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
        self.deviceId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (NSData *)mapUserData {

    
    NSString *dataString = [NSString stringWithFormat:@"login=%@&password=%@&deviceType=%@&deviceId=%@", self.login, self.password, self.deviceType, self.deviceId];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    

    
//    NSDictionary *userData = @{@"login" : self.login, @"password" : self.password, @"deviceType" : self.deviceType, @"deviceId" : self.deviceId};
//    NSData *data = [NSJSONSerialization dataWithJSONObject:userData options:kNilOptions error:nil];
    
    
    return data;

}

@end
