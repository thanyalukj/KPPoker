//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SettingItem.h"


@implementation SettingItem

- (UIView *)accessoryViewWithTableWidth:(CGFloat)width {
    if (!self.textField) {
        UITextField *customTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width - 150, 30)];
        customTextField.delegate = self;
        customTextField.text = self.value;
        customTextField.keyboardType = UIKeyboardTypeAlphabet;
        customTextField.returnKeyType = UIReturnKeyDone;
        customTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField = customTextField;
    }
    return self.textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.value = textField.text;
}

@end