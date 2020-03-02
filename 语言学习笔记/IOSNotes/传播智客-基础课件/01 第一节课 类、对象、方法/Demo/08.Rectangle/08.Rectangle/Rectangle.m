//
//  Rectangle.m
//  08.Rectangle
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

//自定义初始化方法
- (id)initWithWidth:(float)width withHeight:(float)height {
    self = [super init];
    if (self != nil) {
        _width = width;
        _height = height;
    }
    
    return self;
}

//计算周长的方法
- (float)countGirth {
    return (_width + _height)*2;
}

//计算面积
- (float)countArea {
    return _width * _height;
}


@end
