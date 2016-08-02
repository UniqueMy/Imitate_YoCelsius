//
//  UIView+SetRect.h
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * Category模式用于向已经存在的类添加方法从而达到扩展已有类的目的
 * 新添加的方法同样也会被被扩展的类的所有子类自动继承
 * 无法直接修改源代码的时候，Category也可以用于替代这个已有类中某个方法的实体，从而达到修复BUG的目的
 * 当准备有Category来替换某一个方法的时候，一定要保证实现原来方法的所有功能，否则这种替代就是没有意义而且会引起新的BUG
 * 和子类不同的是，Category不能用于向被扩展类添加实例变量
 * Category通常作为一种组织框架代码的工具来使用
 
 *     用途
 
 * 在不创建继承类的情况下实现对已有类的扩展
 * 在没有源代码的情况下可以用来修复BUG
 * 将常用的相关的方法分组
 * 简化类的开发工作（当一个类需要多个程序员协同开发的时候，Category可以将同一个类根据用途分别放在不同的源文件中，从而便于程序员独立开发相应的方法集合）
 */

#define viewWidth    [UIScreen mainScreen].bounds.size.width

#define viewHeight   [UIScreen mainScreen].bounds.size.width

#define StatusBarHeight       20.f

#define NavigationBarHeight   44.f

#define TabbarHeight          49.f

#define StatusAndNavigationBarHeight  (20.f + 44.f)

/**
 *  iPhone4 or iPhone4s
 */
#define  iPhone4_4s     (viewWidth == 320.f && viewHeight == 480.f)

/**
 *  iPhone5 or iPhone5s
 */
#define  iPhone5_5s     (viewWidth == 320.f && viewHeight == 568.f)

/**
 *  iPhone6 or iPhone6s
 */
#define  iPhone6_6s     (viewWidth == 375.f && viewHeight == 667.f)

/**
 *  iPhone6Plus or iPhone6sPlus
 */
#define  iPhone6_6sPlus (viewWidth == 414.f && viewHeight == 736.f)

@interface UIView (SetRect)

/*----------------
 * 绝对坐标
 ----------------*/

@property (nonatomic)CGPoint viewOrigin;
@property (nonatomic)CGSize  viewSize;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

/*----------------
 * 相对坐标
 * readonly 只读性  只能使用get方法  【readwrite】读写  可使用get || set 方法
 ----------------*/

@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;


@end
