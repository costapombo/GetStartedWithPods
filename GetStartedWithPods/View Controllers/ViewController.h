//
//  ViewController.h
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UserInfoTableViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *UsersTableView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

