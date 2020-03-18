//
//  UserPostsViewController.m
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "UserPostsViewController.h"

@interface UserPostsViewController ()

@end

@implementation UserPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"PostCell" bundle:nil] forCellReuseIdentifier:@"PostCell" ];
    
    [self loadPosts];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
    cell.titleContainerLabel.text = [self.posts[indexPath.row] valueForKey:@"title"];
    cell.bodyContainerLabel.text = [self.posts[indexPath.row] valueForKey:@"body"];

    return cell;
}


#pragma mark - Private methods

- (void) loadPosts{
    
    self.tableView.hidden = YES;
    self.loadingView.hidden = NO;
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://jsonplaceholder.typicode.com/posts" parameters:@{ @"userid":[NSString stringWithFormat:@"%ld", self.userID]} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.posts = responseObject;
        [self.tableView reloadData];
        
        self.tableView.hidden = NO;
        self.loadingView.hidden = YES;
        
        NSLog(@"%@", responseObject);
        

        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Try again later" preferredStyle:UIAlertControllerStyleAlert];
        
        [errorAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:errorAlert animated:YES completion:nil];
        self.loadingView.hidden = YES;
    }];
    
}

@end
