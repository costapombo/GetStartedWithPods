//
//  ViewController.m
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSArray *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.UsersTableView.hidden = YES;
}


- (void) loadData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://jsonplaceholder.typicode.com/users" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        data = responseObject;
        [self.UsersTableView reloadData];
        self.loadingView.hidden = YES;
        self.UsersTableView.hidden = NO;
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Try again later" preferredStyle:UIAlertControllerStyleAlert];
        
        [errorAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:errorAlert animated:YES completion:nil];
        self.loadingView.hidden = YES;
        
    }];
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [data[indexPath.row] valueForKey:@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserInfoTableViewController *add=[self.storyboard instantiateViewControllerWithIdentifier:@"UserInfoTableViewController"];
    
    add.data = data[indexPath.row];
    
    [self.navigationController pushViewController:add animated:YES];

    
}



@end
