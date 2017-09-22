//
//  ViewController.m
//  ProductTest
//
//  Created by 最爱是深蓝 on 2017/8/2.
//  Copyright © 2017年 ProductTest. All rights reserved.
//  SVProgressHUD解析使用

#import "ViewController.h"
#import "SVProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton * btn = [UIButton new] ;
    btn.backgroundColor = [UIColor redColor] ;
    btn.frame = CGRectMake(10, 20, 50, 50) ;
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn] ;
    
    UIButton * btn1 = [UIButton new] ;
    btn1.backgroundColor = [UIColor redColor] ;
    btn1.frame = CGRectMake(90, 20, 50, 50) ;
    [btn1 addTarget:self action:@selector(showText) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn1] ;
    
    UIButton * btn2 = [UIButton new] ;
    btn2.backgroundColor = [UIColor redColor] ;
    btn2.frame = CGRectMake(170, 20, 50, 50) ;
    [btn2 addTarget:self action:@selector(showprogress) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn2] ;
    
    UIButton * btn3 = [UIButton new] ;
    btn3.backgroundColor = [UIColor redColor] ;
    btn3.frame = CGRectMake(250, 20, 50, 50) ;
    [btn3 addTarget:self action:@selector(showSuccess) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn3] ;
    
    UIButton * btn4 = [UIButton new] ;
    btn4.backgroundColor = [UIColor redColor] ;
    btn4.frame = CGRectMake(330, 20, 50, 50) ;
    [btn4 addTarget:self action:@selector(showError) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn4] ;

    
    
}

- (void)show{
    [SVProgressHUD show] ;
    
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    
}

- (void)showText {
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
}


- (void)showprogress {
    [SVProgressHUD showProgress:0 status:@"加载中"];
    [self performSelector:@selector(increateProgress) withObject:nil afterDelay:0.3];
}

static float progressValue = 0.0f;
- (void)increateProgress
{
    progressValue += 0.1;
    [SVProgressHUD showProgress:progressValue status:@"加载中"];
    if (progressValue < 1) {
        [self performSelector:@selector(increateProgress) withObject:nil afterDelay:0.3];
    }else{
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.4];
    }
    
}

- (void)dismiss {
    [SVProgressHUD dismiss];
}

- (void)showSuccess {
    [SVProgressHUD showSuccessWithStatus:@"success"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
}

- (void)showError {
    [SVProgressHUD showErrorWithStatus:@"错误警告"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
