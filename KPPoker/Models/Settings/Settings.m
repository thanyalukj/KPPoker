//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "Settings.h"
#import <UIKit/UIKit.h>

@implementation Settings

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.sessionId forKey:@"sessionId"];
    [coder encodeObject:self.userName forKey:@"userName"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.sessionId = [coder decodeObjectForKey:@"sessionId"];
    self.userName = [coder decodeObjectForKey:@"userName"];
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sessionId = @"";
        _userName = [[UIDevice currentDevice] name];
    }
    return self;
}

@end