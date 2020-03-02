//
//  Student.m
//  08.Import
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Student.h"

// .h文件中使用@class,
//在.m文件中使用#import导入

#import "Classes.h"

@implementation Student

- (void)study {
    
    clas = [[Classes alloc]init];
    [clas playball];
}

@end
