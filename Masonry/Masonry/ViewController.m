//
//  ViewController.m
//  Masonry
//
//  Created by 最爱是深蓝 on 2017/9/20.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#define MAS_SHORTHAND//1. 对于约束参数可以省去"mas_"
#define MAS_SHORTHAND_GLOBALS//2. 对于默认的约束参数自动装箱

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
{
    UIScrollView *scrollView ;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * la = [[UILabel alloc] init] ;
    la.backgroundColor = [UIColor redColor] ;
    [self.view addSubview:la] ;
/*
    //宽高100 中心点局中
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
       //尺寸约束
       make.size.mas_equalTo(CGSizeMake(100, 100)) ;
       //位置约束
       make.center.mas_equalTo(self.view) ;
       //相当于下边的两句
        //self.view.mas_centerX这句话可以写成self.view
        make.centerX.mas_equalTo(self.view.mas_centerX) ;
        make.centerY.mas_equalTo(self.view.mas_centerY) ;
    }];
*/

    
/*
    //宽高100 粘着父控件右下角 间距是20 第一种方法
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽度(下边两句一样)
        make.width.equalTo(@100) ;
        make.width.mas_equalTo(100) ;
        //高度
        make.height.equalTo(@100) ;
        make.height.mas_equalTo(100) ;
        //右边
        make.right.equalTo(self.view.mas_right).offset(-20) ;
        //底部
        make.bottom.equalTo(self.view.mas_bottom).offset(-20) ;
        
    }];
*/
    
/*
    //第二种方法
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽度和高度(and with返回的都是self 为了增加可读性)
        //make.width.and.height.mas_equalTo(100) ;
        //make.width.and.height.equalTo(@100) ;
        //make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]) ;
        //make.size.mas_equalTo(CGSizeMake(100, 100)) ;
        make.size.mas_equalTo(200) ;
        //右边
        make.right.equalTo(self.view.mas_right).offset(-20) ;
        //底部
        make.bottom.equalTo(self.view.mas_bottom).offset(-20) ;
    }] ;
*/
    
/*
    //multipliedBy乘以等方法
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        //是父控件的一半
        make.size.mas_equalTo(self.view).multipliedBy(0.5) ;
        make.right.equalTo(self.view.mas_right).offset(-20) ;
        //底部
        make.bottom.equalTo(self.view.mas_bottom).offset(-20) ;
    }] ;
 */

/*
    //各边距相同 都是50
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        //第一种方法
        make.left.mas_equalTo(self.view.mas_left).offset(50) ;
        make.right.mas_equalTo(self.view.mas_right).offset(-50) ;
        make.top.mas_equalTo(self.view.mas_top).offset(50) ;
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50) ;
        
        //第二种方法
        make.left.top.mas_equalTo(self.view).offset(50) ;
        make.right.bottom.mas_equalTo(self.view).offset(-50) ;
       
        //第三种方法
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, -50, -50)) ;
        //当约束冲突发生的时候，我们可以设置view的key来定位是哪个view MASAttachKeys
        MASAttachKeys(la) ;
    }];
 
*/
    
/*(
    //创建view
    NSMutableArray * mut = [NSMutableArray new] ;
    for (int i = 0; i < 5; i ++) {
        UIView * view = [UIView new] ;
        view.backgroundColor = [UIColor redColor] ;
        [self.view addSubview:view] ;
        [mut addObject:view] ;//保存添加的控件
        
    }
    
    //水平方向控件间隔固定 等间隔    多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
    [mut mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:20 tailSpacing:20] ;
    [mut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50) ;
        make.height.mas_equalTo(80) ;//......
    }] ;
    
    //水平方向宽度固定 等间隔   多个固定大小的控件的等间隔排列,变化的是间隔的空隙
    [mut mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:50 leadSpacing:20 tailSpacing:20] ;
    
    [mut mas_makeConstraints:^(MASConstraintMaker *make) {
        
    //数组你不必须都是view
        make.top.mas_equalTo(50) ;
        make.height.mas_equalTo(60) ;
        
    }];
    
*/

    
/*
    //两个视图相对于父视图垂直居中，并且两个视图以及父视图之间的间距均为10 盖度为150 宽度相等
    UILabel * red = [[UILabel alloc] init] ;
    red.backgroundColor = [UIColor redColor] ;
    [self.view addSubview:red] ;
    
    UILabel * blue = [[UILabel alloc] init] ;
    blue.backgroundColor = [UIColor blueColor] ;
    [self.view addSubview:blue] ;
    
    CGFloat padding = 10 ;
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view) ;
        make.left.equalTo(self.view.mas_left).offset(padding) ;
        make.right.equalTo(blue.mas_left).offset(-padding) ;
        make.width.equalTo(blue) ;
        make.height.equalTo(@150) ;
    }] ;
   [blue mas_makeConstraints:^(MASConstraintMaker *make) {
       //make.left.equalTo(red.mas_right).offset(padding) ;
       make.centerY.equalTo(self.view) ;
       make.right.equalTo(self.view.mas_right).offset(-padding) ;
       make.width.equalTo(red) ;
       make.height.equalTo(@150) ;
   }] ;
 */
    
    
/*
    
    //创建滚动视图
    scrollView = [UIScrollView new];
    
    
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(2) ;
    }];
    
    [self setUpContentView] ; //添加内容视图
    
    */
 /*
    1,有两个view，黑色与灰色；
    2,黑色view的左、上、右边距均为20，下边距灰色view 20，宽度自适应，高度与灰色view平分整个界面；
    3,灰色view宽度为黑色view的一半（即左边以中线起始），右、下边距与黑色view相同，高度与黑色view相同。
    */
    UIView * vi = [UIView new] ;
    vi.backgroundColor = [UIColor blackColor] ;
    [self.view addSubview:vi] ;
    UIView * va = [UIView new] ;
    va.backgroundColor = [UIColor grayColor] ;
    [self.view addSubview:va] ;
    
//    // 给黑色view添加约束
//    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        // 添加左、上边距约束
//        make.left.and.top.mas_equalTo(20);
//        // 添加右边距约束
//        make.right.mas_equalTo(-20);
//    }];
//    // 给灰色view添加约束
//    [va mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        // 添加右、下边距约束
//        make.bottom.and.right.mas_equalTo(-20);
//        // 添加高度约束，让高度等于黑色view
//        make.height.equalTo(vi);
//        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
//        make.top.equalTo(vi.mas_bottom).offset(20);
//        // 添加左边距（左边距 = 父容器纵轴横轴中心 + 偏移量0）
//        make.left.equalTo(self.view.mas_centerX).offset(0);
//    }];
    
    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 0, 20)) ;
        make.bottom.equalTo(va.top).offset(-20) ;
        //make.height.equalTo(va) ;
        
    }];
    [va mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.right.bottom.equalTo(self.view).offset(-20) ;
        make.height.equalTo(vi) ;
        make.top.equalTo(vi.bottom).offset(20) ;
      
        make.left.equalTo(vi.centerX).offset(0) ;
    }] ;
    
    
    }

- (void)setUpContentView
{
    //约束UIScrollview上contentView
    UIView * contentView = [UIView new] ;
    [self.view addSubview:contentView] ;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView) ;
        //make.width.equalTo(scrollView) ;//此处必填 关键点
    }] ;
    
    //添加控件到contentView 约束原理与自动布局相同
    UIView * lastview ;
    CGFloat height = 30 ;
    for (int i = 0; i < 15; i ++) {
        UIView * view = [UIView new] ;
        view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 256.0  green:arc4random() % 255 / 256.0 blue:arc4random() % 255 / 256.0 alpha:1.0] ;//随机颜色
        [contentView addSubview:view] ;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastview ? lastview.bottom : @0) ;
            make.left.equalTo(0) ;
            make.width.equalTo(contentView.width) ;
            make.height.equalTo(height) ;
        }] ;
        height += 30 ;
        lastview = view ;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastview.bottom) ;
    }] ;
}



/**
 等间隔排列

 @param axisType 轴线方向
 @param fixedSpacing 间隔大小
 @param leadSpacing 头部间隔
 @param tailSpacing 尾部间隔
 @param fixedItemLength 每个控件的固定长度／宽度

//多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType
                    withFixedSpacing:(CGFloat)fixedSpacing
                         leadSpacing:(CGFloat)leadSpacing
                         tailSpacing:(CGFloat)tailSpacing
{
    
}
// 多个固定大小的控件的等间隔排列,变化的是间隔的空隙
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType
                 withFixedItemLength:(CGFloat)fixedItemLength
                         leadSpacing:(CGFloat)leadSpacing
                         tailSpacing:(CGFloat)tailSpacing
{
    
}


*/





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
