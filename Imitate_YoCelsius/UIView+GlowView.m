//
//  UIView+GlowView.m
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import "UIView+GlowView.h"
#import <objc/runtime.h>

#define GLOWVIEW_LAYER_FLAG  @"UIView+GlowView"

@interface UIView ()

@property (nonatomic,strong) dispatch_source_t dispatchSource;
@property (nonatomic,strong) NSNumber          *glowViewShowFlag;

@end

@implementation UIView (GlowView)

#pragma mark - 动态添加属性

static char dispatchSourceTimerFlag;

- (void)setDispatchSource:(dispatch_source_t)dispatchSource {
    
    /*
     * 关联是指把两个对象相互关联起来，使得其中的一个对象作为另外一个对象的一部分。
     * 为self关联一个【dispatchSource】的静态变量，策略是 指定一个强引用相关联的对象。协会不自动
     *
     */
    
    objc_setAssociatedObject(self, &dispatchSourceTimerFlag, dispatchSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t) dispatchSource {
    /*
     *  获取self中dispatchSourceTimerFlag关键字的关联对象
     */
    return objc_getAssociatedObject(self, &dispatchSourceTimerFlag);
}
static char charGlowViewShowFlag;

- (void)setGlowViewShowFlag:(NSNumber *)glowViewShowFlag {
    
    objc_setAssociatedObject(self, &charGlowViewShowFlag, glowViewShowFlag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowViewShowFlag {
    
    return objc_getAssociatedObject(self, &charGlowViewShowFlag);
}

static char GCDTimerIntervalFlag;

- (void)setGCDTimerInterval:(NSNumber *)GCDTimerInterval {
    
    objc_setAssociatedObject(self, &GCDTimerIntervalFlag, GCDTimerInterval, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)GCDTimerInterval {
    
    return objc_getAssociatedObject(self, &GCDTimerIntervalFlag);
}

static char glowLayerOpacityFlag;

- (void)setGlowLayerOpacity:(NSNumber *)glowLayerOpacity {
    
    objc_setAssociatedObject(self, &glowLayerOpacityFlag, glowLayerOpacity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowLayerOpacity {
    
    return objc_getAssociatedObject(self, &glowLayerOpacityFlag);
}

static char glowDurationFlag;

- (void)setGlowDuration:(NSNumber *)glowDuration {
    
    objc_setAssociatedObject(self, &glowDurationFlag, glowDuration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowDuration {
    
    return objc_getAssociatedObject(self, &glowDurationFlag);
}

#pragma mark - 方法

- (void)createGlowLayerWithColor:(UIColor *)color glowRadius:(CGFloat)radius {
    
    // 获取用来处理图片的图形上下文
    // 参数:   1.所要创建的图片的尺寸   2.指定图片背景是否为不透明   3.指定生产图片的缩放因子【传入0则表示让图片的缩放因子根据屏幕的分辨率而变化】
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    // 渲染上下文  使图片和背景图层再结合的地方更自然
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 创建贝塞尔对象
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:
                          (CGRect){CGPointZero,self.bounds.size.width,self.bounds.size.height}];
    
    // 单独设置填充颜色
    [color setFill];
    
    // 用指定的混合模式和透明度值来描绘受接收路径所包围的区域
    [path fillWithBlendMode:kCGBlendModeSourceAtop alpha:1.f];
    
    CALayer *glowLayer = [CALayer layer];
    glowLayer.name     = GLOWVIEW_LAYER_FLAG;
    glowLayer.frame    = self.bounds;
    
    // contents表示接受的内容
    glowLayer.contents = (__bridge id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    
    // 透明度
    glowLayer.opacity       = 0.f; // 开始时候的透明度为0
    
    // 设置阴影的透明度(0~1之间，0表示完全透明)
    glowLayer.shadowOpacity = 1.f;
    
    // 设置阴影的偏移量，如果为正数，则代表为往右边偏移
    glowLayer.shadowOffset = CGSizeMake(0, 0);
    
    // 设置阴影的颜色
    glowLayer.shadowColor  = (color == nil ? [UIColor redColor].CGColor : color.CGColor);
    
    // 设置阴影的半径
    glowLayer.shadowRadius = (radius > 0 ? radius : 2.f);
    
    [self.layer addSublayer:glowLayer];
    
    // 关闭上下文
    UIGraphicsEndImageContext();
}

- (void)startGlow {
    
    // 遍历
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CALayer *layer = obj;
        
        // 找到layer再进行下面操作
        
        if ([layer.name isEqualToString:GLOWVIEW_LAYER_FLAG]) {
            
            if (self.glowViewShowFlag == nil) {
                self.glowViewShowFlag = [NSNumber numberWithBool:NO];
            }
            
            if (self.dispatchSource == nil) {
                
                
            }
        }
    }];
}

@end
