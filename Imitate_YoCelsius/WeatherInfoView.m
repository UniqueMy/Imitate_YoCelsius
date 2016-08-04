//
//  WeatherInfoView.m
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import "WeatherInfoView.h"
#import "TitleMoveLabel.h"
#import "CGRectStoreValue.h"


@interface WeatherInfoViewStoreValue : NSObject

@property (nonatomic) CGRect startRect;
@property (nonatomic) CGRect midRect;
@property (nonatomic) CGRect endRect;

@end

@implementation WeatherInfoViewStoreValue

@end


@interface WeatherInfoView ()

@property (nonatomic,strong) TitleMoveLabel   *titleMoveLabel;
@property (nonatomic,strong) UILabel          *glowLabel;
@property (nonatomic,strong) CGRectStoreValue *storeValue;

@end

@implementation WeatherInfoView

- (void)buildView {
    
    _titleMoveLabel = [TitleMoveLabel withText:@"Weather"];
    [self addSubview:_titleMoveLabel];
    
    _storeValue = [CGRectStoreValue new];
    
}

- (void)show {
    
    [_titleMoveLabel show];
    
    _glowLabel               = [[UILabel alloc] initWithFrame:self.bounds];
    _glowLabel.textAlignment = 1;
    _glowLabel.font          = [UIFont fontWithName:WEATHER_TIME size:110];
   
     // 记录三个rect的值
    
    _glowLabel.y             = 10;
    _glowLabel.x             = 5;
    _storeValue.midRect      = _glowLabel.frame;
    _glowLabel.y            -= 10;
    _storeValue.startRect    = _glowLabel.frame;
    _glowLabel.y            += 20;
    _storeValue.endRect      = _glowLabel.frame;
    
    _glowLabel.frame         = _storeValue.startRect;
    
    
    
    
    
}


@end
