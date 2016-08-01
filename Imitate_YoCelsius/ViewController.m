//
//  ViewController.m
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import "ViewController.h"

#import "WeatherView.h"


@interface ViewController ()

@property (nonatomic,strong) WeatherView *weatherView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //天气的View
    _weatherView                     = [[WeatherView alloc] initWithFrame:self.view.bounds];
    _weatherView.layer.masksToBounds = YES; // 视图图层上的子图层，超出父图层的部分裁剪掉
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
