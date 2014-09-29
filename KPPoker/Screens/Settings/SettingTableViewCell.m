//
//  SettingTableViewCell.m
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell {
    __weak UITextField *_textField;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self setupView];
}

- (void)setupView {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
