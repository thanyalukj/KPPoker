//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SessionItem.h"


@implementation SessionItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = @"Session Id";
        self.value = @"";
    }
    return self;
}

- (UIView *)accessoryViewWithTableWidth:(CGFloat)width {
    if (!self.textField) {
        self.textField = (UITextField *)[super accessoryViewWithTableWidth:width];
        self.textField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return self.textField;
}

@end