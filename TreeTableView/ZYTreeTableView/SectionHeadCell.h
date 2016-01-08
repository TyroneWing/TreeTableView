//
//  SectionHeadCell.h
//  TreeTableView
//
//  Created by yi on 16/1/7.
//  Copyright © 2016年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeModel.h"

@interface SectionHeadCell : UITableViewCell
@property (retain,strong,nonatomic) TreeModel *node; //data
@property (strong,nonatomic) IBOutlet UIImageView *arrowView; //箭头
@property (strong,nonatomic) IBOutlet UILabel *name;
@end
