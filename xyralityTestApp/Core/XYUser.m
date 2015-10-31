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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.deviceType = [NSString stringWithFormat:@"%@ - %@ %@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
        self.deviceId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (NSData *)mapUserData {

    NSDictionary *userData = @{@"login" : self.login, @"password" : self.password, @"deviceType" : self.deviceType, @"deviceId" : self.deviceId};
    NSData *data = [NSJSONSerialization dataWithJSONObject:userData options:kNilOptions error:nil];
    
    return data;

}

@end