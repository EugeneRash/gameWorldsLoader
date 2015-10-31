//
//  XYGameWorld.h
//  xyralityTestApp
//
//  Created by rash on 10/31/15.
//  Copyright © 2015 rash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYGameWorld : NSObject

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSNumber *worldId;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *mapURL;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *worldStatus;

- (instancetype)initWithResponse:(NSDictionary *)response;

@end
