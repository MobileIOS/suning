//
//  DrugCell.h
//  ShoppingProject
//
//  Created by maoqian on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DrugListModel;
@interface DrugCell : UITableViewCell
@property(nonatomic,strong)DrugListModel *drugModel;


-(CGFloat)getCellHeight;

@end
