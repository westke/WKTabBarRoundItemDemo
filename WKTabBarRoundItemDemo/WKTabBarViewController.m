//
//  WKTabBarViewController.m
//  WKTabBarRoundItemDemo
//
//  Created by westke on 15/6/24.
//  Copyright (c) 2015年 westke. All rights reserved.
//
#import "WKTabBar.h"
#import "WKTabBarViewController.h"

@interface WKTabBarViewController ()

@end

@implementation WKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKTabBar *tabBar = [[WKTabBar alloc] init];
    tabBar.image = [UIImage imageNamed:@"divisionLogo"];
    tabBar.itemCount = 5;
    tabBar.controller = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
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
