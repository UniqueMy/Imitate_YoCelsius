//
//  TitleMoveLabel.m
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import "TitleMoveLabel.h"

@interface TitleMoveLabel ()

@property (nonatomic,strong) UILabel *label;

@property (nonatomic) CGRect startRect;
@property (nonatomic) CGRect midRect;
@property (nonatomic) CGRect endRect;

@end

@implementation TitleMoveLabel

- (void)buildView {
    
    self.backgroundColor   = [UIColor clearColor];
    
    _label                 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.backgroundColor = [UIColor clearColor];
    _label.text            = _text;
    [self addSubview:_label];
    
    // 设置文本颜色
    if (_textColor) {
        _label.textColor = _textColor;
    }
    
    // 设置文本字体
    if (_font) {
        _label.font = _font;
    }
    
    // 重置frame值
    [_label sizeToFit];
    
    // 重设当前view的frame值
    self.width  = self.label.width;
    self.height = self.label.height;
    
    
    // 通过移动的距离moveGap 设置三个rect的值
    self.label.x   -= self.moveGap;
    self.startRect  = self.label.frame;
    
    self.label.x   += self.moveGap;
    self.midRect    = self.label.frame;
    
    self.label.x   += self.moveGap;
    self.endRect    = self.label.frame;
    
    
    // 复位frame值
    self.label.frame = self.startRect;
    self.label.alpha = 0.f;
    
}

- (void)show {
    
    [UIView animateWithDuration:TITLE_MOVE_LABEL_SHOW_DURATION animations:^{
        self.label.frame = self.midRect;
        self.label.alpha = 1.f;
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:TITLE_MOVE_LABEL_HIDE_DURATION animations:^{
        
        self.label.frame = self.endRect;
        self.label.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        self.label.frame = self.startRect;
    }];
}

// 设置title内容
+ (TitleMoveLabel *)withText:(NSString *)text {
    
    TitleMoveLabel *titleMove = [[TitleMoveLabel alloc] initWithFrame:CGRectMake(20, 10, 0, 0)];
    titleMove.text            = text;
    titleMove.textColor       = [UIColor blackColor];
    if (iPhone4_4s || iPhone5_5s) {
        
        titleMove.font    = [UIFont fontWithName:LATO_BOLD size:LATO_14];
        
    } else if (iPhone6_6s) {
        
        titleMove.font    = [UIFont fontWithName:LATO_LIGHT size:17];
        
    } else if (iPhone6_6sPlus) {
        
        titleMove.font    = [UIFont fontWithName:LATO_LIGHT size:20];
        
    } else {
        
        titleMove.font    = [UIFont fontWithName:LATO_BOLD size:LATO_14];
    }
    titleMove.moveGap = 10.f;
    [titleMove buildView];
    
    return titleMove;
}

@end
