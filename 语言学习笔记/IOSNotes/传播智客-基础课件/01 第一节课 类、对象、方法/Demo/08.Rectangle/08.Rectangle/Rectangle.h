//
//  Rectangle.h
//  08.Rectangle
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//矩形类
@interface Rectangle : NSObject {
    float _width;    //宽
    float _height;   //高
}

//自定义初始化方法
- (id)initWithWidth:(float)width withHeight:(float)height;

//计算周长的方法
- (float)countGirth;

//计算面积
- (float)countArea;

@end
