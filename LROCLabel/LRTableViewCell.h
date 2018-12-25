//
//  LRTableViewCell.h
//  LROCLabel
//
//  Created by dalizi on 2018/12/24.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRTableModel;

@interface LRTableViewCell : UITableViewCell

- (void)reloadCell:(LRTableModel *)cellModel;
+ (NSString *)cellIdentifier;

@end
