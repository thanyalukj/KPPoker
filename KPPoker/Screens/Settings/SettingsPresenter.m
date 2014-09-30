//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SettingsPresenter.h"
#import "SessionItem.h"
#import "UserItem.h"
#import "SettingGroupItem.h"
#import "Configuration.h"
#import "Viewing.h"


@implementation SettingsPresenter {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        _settingGroups = [self createSettingGroups];
    }
    return self;
}

- (NSArray *)createSettingGroups {
    return @[[self sessionGroupItem]];
}

- (SettingGroupItem *)sessionGroupItem {
    SettingGroupItem *groupItem = [[SettingGroupItem alloc] init];
    groupItem.title = @"Settings";
    groupItem.settings =  @[[[SessionItem alloc] init],[[UserItem alloc] init]];
    return groupItem;
}

- (void)viewDidLoad {
    [self.viewDelegate reloadData];
}

- (SettingGroupItem *)groupItemAtIndex:(NSInteger)index {
    return (SettingGroupItem *)self.settingGroups[(NSUInteger)index];
}

- (void)viewDismissed {
    [[Configuration instance] saveSettings];
}

@end