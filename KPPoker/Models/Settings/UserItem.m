//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "UserItem.h"


@implementation UserItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = @"User";
        self.value = [[UIDevice currentDevice] name];
    }
    return self;
}

@end