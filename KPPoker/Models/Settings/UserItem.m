//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "UserItem.h"
#import "Configuration.h"
#import "Settings.h"


@implementation UserItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = @"User";
        self.value = [Configuration instance].settings.userName;
        self.placeHolder = @"User name";
    }
    return self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [super textFieldDidEndEditing:textField];
    [Configuration instance].settings.userName = self.value;
}

@end