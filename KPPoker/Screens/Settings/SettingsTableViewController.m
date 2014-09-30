//
//  SettingsTableViewController.m
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsPresenter.h"
#import "SettingItem.h"
#import "SettingGroupItem.h"
#import "Viewing.h"

@interface SettingsTableViewController () <Viewing>

@end

@implementation SettingsTableViewController {
    SettingsPresenter *_presenter;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self configurePresenter];
    }
    return self;
}

- (void)configurePresenter {
    _presenter = [[SettingsPresenter alloc] init];
    _presenter.viewDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureNavigationBar];
    [_presenter viewDidLoad];
}

- (void)configureNavigationBar {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissView:)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)dismissView:(id)sender {
    [_presenter viewDismissed];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _presenter.settingGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SettingGroupItem *groupItem = [_presenter groupItemAtIndex:(NSUInteger) section];
    return [groupItem.settings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingItem *item = [self settingItemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = item.label;
    cell.accessoryView = [item accessoryViewWithTableWidth:tableView.bounds.size.width];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SettingGroupItem *groupItem = [_presenter groupItemAtIndex:(NSUInteger) section];
    return groupItem.title;
}

- (SettingItem *)settingItemAtIndexPath:(NSIndexPath *)indexPath {
    SettingGroupItem *groupItem = [_presenter groupItemAtIndex:(NSUInteger) indexPath.section];
    SettingItem *item = groupItem.settings[(NSUInteger)indexPath.row];
    return item;
}

#pragma mark - Viewing

- (void)reloadData {
    [self.tableView reloadData];
}

@end
