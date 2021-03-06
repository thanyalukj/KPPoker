//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SessionItem.h"
#import "Configuration.h"
#import "Settings.h"
#import "SessionsInteractor.h"


@implementation SessionItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = @"Session ID";
        self.placeHolder = @"Session ID";
        self.value = [Configuration instance].settings.sessionId;
    }
    return self;
}

- (void)configureTextField:(UITextField *)textField {
    [super configureTextField:textField];
    textField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [super textFieldDidEndEditing:textField];
    [Configuration instance].settings.sessionId = self.value;
    NSString *_userName = [Configuration instance].settings.userName;
    SessionsInteractor *_sessionsInteractor = [[SessionsInteractor alloc] initWithSessionId:self.value personId:_userName];
    [_sessionsInteractor start];
}

@end