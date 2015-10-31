//
//  XYGameWorld.m
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import "XYGameWorld.h"

@implementation XYGameWorld

- (instancetype)initWithResponse:(NSDictionary *)response
{
    self = [super init];
    if (self) {

        self.country = response[@"country"];
        self.worldId = response[@"worldId"];
        self.language = response[@"language"];
        self.mapURL = response[@"mapURL"];
        self.name = response[@"name"];
        self.url = response[@"url"];
        self.worldStatus = [response valueForKeyPath:@"worldStatus.description"];

    }
    return self;
}


@end
