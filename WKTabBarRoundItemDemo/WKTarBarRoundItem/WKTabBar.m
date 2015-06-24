//
//  WKTabBar.m
//  WKTabBarRoundItemDemo
//
//  Created by westke on 15/6/24.
//  Copyright (c) 2015年 westke. All rights reserved.
//

#import "WKTabBar.h"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"

//修正线与圆按钮旁边的空间距离
static CGFloat const kFixTopLineSpace = 15.0f;
//item的数量
static NSInteger kItemCount = 0;
//图片的宽高放大倍数
static CGFloat const kScale = 1.5;

@interface WKTabBar()
@property (nonatomic, weak) UIButton *roundItem;

@end

@implementation WKTabBar
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _roundItem    = [UIButton buttonWithType:UIButtonTypeCustom];
        [_roundItem addTarget:self action:@selector(roundItemClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_roundItem];
    }
    return self;
}
#pragma mark - Draw
- (void)drawRect:(CGRect)rect {
    //设置为白色先
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, rect);
    //把消除的上边线花出来，但是留出少许空间
    CGPoint startPoint   = CGPointMake(0, 0);
    CGPoint endPoint     = CGPointMake(_roundItem.x + kFixTopLineSpace, 0);
    [self drawLineWithContext:context startPoint:startPoint endPoint:endPoint];
    CGFloat width        = [UIScreen mainScreen].bounds.size.width;
    startPoint           = CGPointMake(_roundItem.x - kFixTopLineSpace + CGRectGetWidth(_roundItem.bounds), 0);
    endPoint             = CGPointMake(width, 0);
    [self drawLineWithContext:context startPoint:startPoint endPoint:endPoint];
}
- (void)drawLineWithContext:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    CGPathCloseSubpath(path);
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}
#pragma mark - LayoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置item的位置
    _roundItem.centerX = self.width * 0.5;
    _roundItem.centerY = self.height * 0.3;
    // 将中间的item隐藏
    CGFloat itemIndex      = 0;
    for (UIView *child in self.subviews) {
        Class class            = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 当item的数量不同的时候分情况讨论
            if ((itemIndex == 1 && kItemCount == 3) || (itemIndex == 2 && kItemCount == 5)) {
                child.hidden           = YES;
            }
            itemIndex++;
        }
    }
}
//消除点击中间圆按钮的上半部分不响应的bug
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint hitPoint = [_roundItem convertPoint:point fromView:self];
    if ([_roundItem pointInside:hitPoint withEvent:event]) {
        return self.roundItem;
    }
    return [super hitTest:point withEvent:event];
}

#pragma mark - roundItemClick 
- (void)roundItemClick {
    if (_controller) {
        _controller.selectedIndex = kItemCount == 3 ? 1 :2;
    }
}
#pragma mark - Setter
- (void)setItemCount:(NSInteger)itemCount {
    kItemCount = itemCount;
    [self setNeedsDisplay];
}
- (void)setImage:(UIImage *)image {
    [_roundItem setImage:image forState:UIControlStateNormal];
    CGFloat width       = _roundItem.currentImage.size.width * kScale;
    CGFloat hight       = _roundItem.currentImage.size.height * kScale;
    self.roundItem.size = CGSizeMake(width, hight);
    [self setNeedsDisplay];
}

@end
