//
//  Shape.m
//  task8
//
//  Created by wei.chen on 12-12-13.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Shape.h"

@implementation Shape

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}


- (void)draw {
    NSLog(@"绘制形状效果");
}

@end
