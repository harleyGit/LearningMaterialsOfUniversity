//
//  main.m
//  03 task4
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{
    
    Student *stu = [[Student alloc] init];
    //[stu study];
    [stu finishTask];
    [stu dontLate];
    
//    [stu wearNeat];
    //判断wearNeat方法是否在Student类中定义,如果定义了，才调用
    if ([stu respondsToSelector:@selector(wearNeat)]) {
        [stu wearNeat];
    }
    

    return 0;
}

