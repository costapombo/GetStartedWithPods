//
//  PostTableViewCell.h
//  GetStartedWithPods
//
//  Created by Pedro Costa on 16/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleContainerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyContainerLabel;

@end

NS_ASSUME_NONNULL_END
