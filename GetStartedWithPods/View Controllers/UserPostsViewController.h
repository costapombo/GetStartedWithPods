//
//  UserPostsViewController.h
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "PostTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserPostsViewController : UIViewController

@property NSInteger userID;
@property NSArray *posts;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

NS_ASSUME_NONNULL_END
