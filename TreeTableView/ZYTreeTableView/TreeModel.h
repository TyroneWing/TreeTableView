//
//  TreeModel.h
//  TreeTableView
//
//  Created by yi on 16/1/7.
//  Copyright © 2016年 yi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    NodeTypeSectionHead,
    NodeTypeRow,
}NodeType;

@interface TreeModel : NSObject

//@property (nonatomic) int nodeLevel; //节点所处层次
@property (nonatomic) NodeType type; //节点类型
@property (nonatomic) id nodeData;//节点数据
@property (nonatomic) BOOL isExpanded;//节点是否展开
@property (strong,nonatomic) NSMutableArray *sonNodes;//子节点

@end
