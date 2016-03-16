//
//  ViewController.m
//  FoxBaseDrawDemo
//
//  Created by 徐惠雨 on 15/12/17.
//  Copyright © 2015年 XFoxer. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"


/*!
 *  @brief 基础作图方式
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    DrawView *drawView = [[DrawView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
