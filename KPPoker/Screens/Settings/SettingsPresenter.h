//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SettingGroupItem;
@protocol Viewing;


@interface SettingsPresenter : NSObject

@property (nonatomic) NSArray *settingGroups;
@property (nonatomic, weak) id<Viewing> viewDelegate;

- (SettingGroupItem *)groupItemAtIndex:(NSInteger)index;

- (void)viewDidLoad;

- (void)viewDismissed;
@end