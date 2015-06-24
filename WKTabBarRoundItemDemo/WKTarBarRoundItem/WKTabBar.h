//
//  WKTabBar.h
//  WKTabBarRoundItemDemo
//
//  Created by westke on 15/6/24.
//  Copyright (c) 2015年 westke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKTabBar : UITabBar
@property (nonatomic, weak) UITabBarController *controller;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *selectedImage;
@property (assign, nonatomic) NSInteger itemCount;
@end
