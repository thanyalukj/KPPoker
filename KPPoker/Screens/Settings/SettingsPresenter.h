//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SettingGroupItem;


@interface SettingsPresenter : NSObject

@property (nonatomic) NSArray *settingGroups;

- (SettingGroupItem *)groupItemAtIndex:(NSInteger)index;

- (void)viewDismissed;
@end