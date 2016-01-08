//
//  RowCell.h
//  TreeTableView
//
//  Created by yi on 16/1/7.
//  Copyright © 2016年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeModel.h"

@interface RowCell : UITableViewCell
@property (retain,strong,nonatomic) TreeModel *node;//data
@property (strong,nonatomic) IBOutlet UIImageView *headImg;
@property (strong,nonatomic) IBOutlet UILabel *signture;
@property (strong,nonatomic) IBOutlet UILabel *name;
@end
