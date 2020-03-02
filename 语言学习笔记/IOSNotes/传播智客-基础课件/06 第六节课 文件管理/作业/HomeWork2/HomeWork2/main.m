//
//  main.m
//  HomeWork2
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WriteDate.h"

/*
 创建一个Date.text文件，获取当前的日期，将日期格式为“2012/02/14 05:20:00”的形式。然后一秒钟记录一次，将新的时间存入到文件中。
 
 2012/02/14 05:20:01
 2012/02/14 05:20:02
 2012/02/14 05:20:03
 
 
*/

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        [[[WriteDate alloc] init] runWrite];
    }
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

