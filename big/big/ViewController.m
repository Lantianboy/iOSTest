//
//  ViewController.m
//  big
//
//  Created by 最爱是深蓝 on 2017/9/25.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView * tabHeadView ;
    UIButton * userImage ;
    UITableView * tab ;
    
    
    
    NSArray * dataSource ;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = @[
                   @[@{@"title":@"个人收藏",@"image":@"MoreMyFavorites"}],
                   @[@{@"title":@"我的银行卡",@"image":@"MoreMyBankCard"},@{@"title":@"我的游戏",@"image":@"MoreGame"}],
                   @[@{@"title":@"系统设置",@"image":@"MoreSetting"},@{@"title":@"我的卡包",@"image":@"MyCardPackageIcon"}]
                   ];
    
    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] ;
    tab.dataSource = self ;
    tab.delegate = self ;
    [self.view addSubview:tab] ;
    
    //去掉tableview底部多余的表格线
    //[tab setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]] ;
    
    //关闭自动滚动调整 初始坐标从0 0 开始 默认为YES
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    //cell分割线颜色
    [tab setSeparatorColor:[UIColor redColor]] ;
    
    tabHeadView = [[UIImageView alloc] init] ;
    //tabHeadView.backgroundColor = [UIColor redColor] ;
    tabHeadView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300) ;
    tabHeadView.image = [UIImage imageNamed:@"yangmi"] ;
    
    userImage = [UIButton new] ;
    userImage.frame = CGRectMake(0, 0, 80, 80) ;
    userImage.center = CGPointMake(self.view.frame.size.width / 2 + 120, 200) ;
    userImage.layer.cornerRadius = 40 ;
    userImage.layer.masksToBounds = YES ;
    
    [userImage setBackgroundImage:[UIImage imageNamed:@"mayun.jpg"] forState:UIControlStateNormal] ;
    [tabHeadView addSubview:userImage] ;
    
    tab.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)] ;
    
    [tab.tableHeaderView addSubview:tabHeadView] ;
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat width = self.view.frame.size.width ;
    //图片的宽度
    CGFloat yOffset = scrollView.contentOffset.y ;
    //偏移的y值
    if (yOffset < 0) {
        CGFloat totaloffset = 300 + ABS(yOffset) ;
        CGFloat f =totaloffset / 300 ;
        //拉伸后的frame是等比例缩放的
        tabHeadView.frame = CGRectMake(-(width * f-width) / 2, yOffset, width * f, totaloffset) ;
        
        CGFloat ma = 80 + ABS(yOffset) ;
        CGFloat yu = ma / 80 ;
        
        userImage.frame = CGRectMake(0, 0, 80* yu, ma) ;
        userImage.center = CGPointMake(self.view.frame.size.width / 2 + 120 * f , 200* f ) ;
        userImage.layer.cornerRadius = 40 * yu ;
    }else{
        tabHeadView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300) ;
        userImage.frame = CGRectMake(0, 0, 80, 80) ;
        userImage.center = CGPointMake(self.view.frame.size.width / 2 + 120, 200) ;
    }
    
        
        
    
    
//    //获取偏移量
//    CGPoint offset = scrollView.contentOffset;
//    //判断是否改变
//    if (offset.y < 0) {
//        CGRect rect = tabHeadView.frame;
//        //我们只需要改变图片的y值和高度即可
//        rect.origin.y = offset.y;
//        rect.size.height = 300 - offset.y;
//        tabHeadView.frame = rect;
//        
//           }
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray* arr = dataSource[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] firstObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    cell.lab.text = dataSource[indexPath.section][indexPath.row][@"title"];
    cell.img.image=[UIImage imageNamed:dataSource[indexPath.section][indexPath.row][@"image"]]  ;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
