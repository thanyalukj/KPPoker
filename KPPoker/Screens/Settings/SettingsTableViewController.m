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

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController {
    SettingsPresenter *_presenter;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _presenter = [[SettingsPresenter alloc] init];

    [self configureNavigationBar];
    [self.tableView reloadData];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
