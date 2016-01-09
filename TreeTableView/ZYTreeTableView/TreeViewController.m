//
//  TreeViewController.m
//  TreeTableView
//
//  Created by yi on 16/1/7.
//  Copyright © 2016年 yi. All rights reserved.
//

#import "TreeViewController.h"
#import "TreeModel.h"
#import "SectionHeadCell.h"
#import "RowCell.h"
#import "SectionHeadModel.h"
#import "RowModel.h"

@interface TreeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic) NSMutableArray* dataArray;
@property(strong,nonatomic) UITableView *myTableView;
@end

@implementation TreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _dataArray = [[NSMutableArray alloc] init];
    //添加演示数据
    [self addTestData];
    
    _myTableView = [[UITableView alloc]init];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height);
    _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_myTableView];
}

- (void)addTestData
{
    /**
     第一层
     */
    TreeModel *node = [[TreeModel alloc]init];
    node.type = NodeTypeSectionHead;
    node.sonNodes = nil;
    node.isExpanded = YES;//关闭状态
    SectionHeadModel *tmp =[[SectionHeadModel alloc]init];
    tmp.headTitle = @"测试";
    node.nodeData = tmp;
    
    TreeModel *node1 = [[TreeModel alloc]init];
    node1.type = NodeTypeSectionHead;//type 1的cell
    node1.sonNodes = nil;
    node1.isExpanded = NO;//关闭状态
    SectionHeadModel *tmp1 =[[SectionHeadModel alloc]init];
    tmp1.headTitle = @"测试1";
    node1.nodeData = tmp1;
    
    TreeModel *node2 = [[TreeModel alloc]init];
    node2.type = NodeTypeSectionHead;//type 1的cell
    node2.sonNodes = nil;
    node2.isExpanded = FALSE;//关闭状态
    SectionHeadModel *tmp2 =[[SectionHeadModel alloc]init];
    tmp2.headTitle = @"火影忍者";
    node2.nodeData = tmp2;
    
    TreeModel *node3 = [[TreeModel alloc]init];
    node3.type = NodeTypeSectionHead;
    node3.sonNodes = nil;
    node3.isExpanded = FALSE;
    SectionHeadModel *tmp3 =[[SectionHeadModel alloc]init];
    tmp3.headTitle = @"海贼王";
    node3.nodeData = tmp3;
    
    
    /**
     第二层
     */
    TreeModel *node4 = [[TreeModel alloc]init];
    node4.type = NodeTypeRow;
    node4.sonNodes = nil;
    node4.isExpanded = FALSE;
    RowModel *tmp4 =[[RowModel alloc]init];
    tmp4.name = @"李四";
    tmp4.signture = @"我兄弟张三在哪!!!!";
    tmp4.headImgPath = @"4.png";
    node4.nodeData = tmp4;

    TreeModel *node5 = [[TreeModel alloc]init];
    node5.type = NodeTypeRow;//type 2的cell
    node5.sonNodes = nil;
    node5.isExpanded = FALSE;
    RowModel *tmp5 =[[RowModel alloc]init];
    tmp5.name = @"蒙奇·D·路飞";
    tmp5.signture = @"草帽草帽草帽。。。。";
    tmp5.headImgPath = @"5.png";
    node5.nodeData = tmp5;

    TreeModel *node6 = [[TreeModel alloc]init];
    node6.type = NodeTypeRow;
    node6.sonNodes = nil;
    node6.isExpanded = FALSE;
    RowModel *tmp6 =[[RowModel alloc]init];
    tmp6.name = @"张三";
    tmp6.signture = @"把头用力撞向键盘就能治好了。。";
    tmp6.headImgPath = @"6.png";
    node6.nodeData = tmp6;

    TreeModel *node7 = [[TreeModel alloc]init];
    node7.type = NodeTypeRow;
    node7.sonNodes = nil;
    node7.isExpanded = FALSE;
    RowModel *tmp7 =[[RowModel alloc]init];
    tmp7.name = @"鸣人";
    tmp7.signture = @"最爱一乐拉面~~~";
    tmp7.headImgPath = @"7.png";
    node7.nodeData = tmp7;

    TreeModel *node8 = [[TreeModel alloc]init];
    node8.type = NodeTypeRow;
    node8.sonNodes = nil;
    node8.isExpanded = FALSE;
    RowModel *tmp8 =[[RowModel alloc]init];
    tmp8.name = @"佐助";
    tmp8.signture = @"鼬的羁绊";
    tmp8.headImgPath = @"8.png";
    node8.nodeData = tmp8;

    TreeModel *node9 = [[TreeModel alloc]init];
    node9.type = NodeTypeRow;
    node9.sonNodes = nil;
    node9.isExpanded = FALSE;
    RowModel *tmp9 =[[RowModel alloc]init];
    tmp9.name = @"自来也";
    tmp9.signture = @"じらいや 、JIRAIYA就这样死了";
    tmp9.headImgPath = @"9.png";
    node9.nodeData = tmp9;
    
    node.sonNodes = [NSMutableArray arrayWithObjects:node4,node5,nil];
    node1.sonNodes = [NSMutableArray arrayWithObjects:node6,nil];
    node2.sonNodes = [NSMutableArray arrayWithObjects:node7,node8,node9,nil];
    node3.sonNodes = [NSMutableArray arrayWithObjects:node5,nil];
    
    _dataArray = [NSMutableArray arrayWithObjects:node,node1,node2,node3, nil];
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    
    TreeModel *node = _dataArray[section];
    if (node.isExpanded) {
        return node.sonNodes.count + 1;
    }
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"SectionHeadCell";
    static NSString *indentifier1 = @"RowCell";
    
    TreeModel *node;
    if (indexPath.row == NodeTypeSectionHead) {
        node = _dataArray[indexPath.section];
    } else {
        TreeModel *nodeSection = _dataArray[indexPath.section];
        node = nodeSection.sonNodes[indexPath.row-1];
    }
    if(node.type == NodeTypeSectionHead) {
        SectionHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SectionHeadCell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        SectionHeadModel *nodeData = node.nodeData;
        cell.name.text = nodeData.headTitle;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        return cell;
    } else {
        RowCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier1];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"RowCell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        RowModel *nodeData = node.nodeData;
        cell.name.text = nodeData.name;
        cell.signture.text = nodeData.signture;
        [cell.headImg setImage:[UIImage imageNamed:nodeData.headImgPath]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

//点击箭头无旋转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TreeModel *node = _dataArray[indexPath.section];
        BOOL isExpand = node.isExpanded;
        
 ///////////////////////////////////////////////////
        //控制Tree显示样式
        for (int i = 0; i<_dataArray.count; i++) {
            TreeModel *nodeI = _dataArray[i];
            if (nodeI.isExpanded) {

                SectionHeadCell *cell = (SectionHeadCell*)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];

                if(cell.node.isExpanded){
                    cell.arrowView.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);

                } else {
                    cell.arrowView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
                }
            }
            nodeI.isExpanded = NO;
        }
 ///////////////////////////////////////////////////

        node.isExpanded = !isExpand;
        SectionHeadCell *cell = (SectionHeadCell*)[tableView cellForRowAtIndexPath:indexPath];
        if(cell.node.isExpanded){
            
            cell.name.transform = CGAffineTransformMakeRotation(M_PI_2);
            cell.arrowView.transform = CGAffineTransformMakeRotation(M_PI_2);

        } else {
            cell.arrowView.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);
        }
        [tableView reloadData];
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    return 70;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
