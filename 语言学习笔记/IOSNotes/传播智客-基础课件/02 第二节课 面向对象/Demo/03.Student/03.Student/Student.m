//
//  Student.m
//  03.Student
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Student.h"

@implementation Student

//覆写父类的work方法
- (void)work {
    
    //调用父类的work方法
    [super work];
    
    //死循环调用当前方法，死循环递归
    //[self work];
    
    NSLog(@"学生开始学习了!");
}

@end
