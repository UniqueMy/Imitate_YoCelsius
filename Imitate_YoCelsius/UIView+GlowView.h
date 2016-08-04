//
//  UIView+GlowView.h
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GlowView)

@property (nonatomic,strong) NSNumber *GCDTimerInterval; // 定时器的时间间隔 float值
@property (nonatomic,strong) NSNumber *glowDuration;     // layer动画的时间长度 float值
@property (nonatomic,strong) NSNumber *glowLayerOpacity; // 设置glowlayer的动画透明度的范围 [0,1]


- (void)createGlowLayerWithColor:(UIColor *)color glowRadius:(CGFloat)radius;
- (void)startGlow;
- (void)glowToGlowLayerOnce;
- (void)glowToNormalLayerOnce;

@end
