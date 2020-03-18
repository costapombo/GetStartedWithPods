//
//  UserInfoTableViewController.m
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "UserInfoTableViewController.h"


@interface UserInfoTableViewController (){
    NSDictionary *displayMap;
    NSArray *displayOrder;
}

@end

@implementation UserInfoTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserDetailCell" bundle:nil] forCellReuseIdentifier:@"UserDetailCell" ];
    
    self.title = [self.data valueForKey:@"name"];
    displayOrder = @[@"Details", @"Contacts", @"Company", @"Address"];
    displayMap = @{
        @"Details": @[@"name", @"username"],
        @"Contacts": @[@"phone", @"email"],
        @"Company": @[@"name", @"catchPhrase", @"bs"],
        @"Address": @[@"street", @"suite", @"city", @"zipcode"]
    };
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return displayOrder.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[displayMap valueForKey:displayOrder[section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell" forIndexPath:indexPath];
    
    NSString *sectionName = displayOrder[indexPath.section];
    NSString *value;
    
    NSString *key = [displayMap valueForKey:sectionName][indexPath.row];

    
    if([sectionName isEqualToString:@"Company"]){
        value = [[self.data valueForKey:@"company"] valueForKey:key];
    }else if ([sectionName isEqualToString:@"Address"]){
         value = [[self.data valueForKey:@"address"] valueForKey:key];
    }else{
        value = [self.data valueForKey:key];
    }
    
    
    cell.keyName.text = key;
    cell.keyValue.text = value;
    
    

    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString * sectionName = displayOrder[section];
    
    return [sectionName isEqualToString:@"Details"] ? nil : sectionName;
    
}


- (IBAction)showPosts:(id)sender {
    UserPostsViewController *add=[self.storyboard instantiateViewControllerWithIdentifier:@"UserPostsViewController"];
     add.userID = (NSInteger)[self.data valueForKey:@"id"];
     [self.navigationController pushViewController:add animated:YES];
}


@end
