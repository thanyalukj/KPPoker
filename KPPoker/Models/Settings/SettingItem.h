//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingItem : NSObject <UITextFieldDelegate>

@property (nonatomic) NSString *label;
@property (nonatomic) NSString *value;
@property (nonatomic) UITextField *textField;

- (UIView *)accessoryViewWithTableWidth:(CGFloat)width;
@end