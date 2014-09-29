//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SessionItem.h"
#import "Configuration.h"
#import "Settings.h"


@implementation SessionItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = @"Session Id";
        self.value = [Configuration instance].settings.sessionId;
    }
    return self;
}

- (UIView *)accessoryViewWithTableWidth:(CGFloat)width {
    if (!self.textField) {
        self.textField = (UITextField *)[super accessoryViewWithTableWidth:width];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self.textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [super textFieldDidEndEditing:textField];
    [Configuration instance].settings.sessionId = self.value;
}

@end