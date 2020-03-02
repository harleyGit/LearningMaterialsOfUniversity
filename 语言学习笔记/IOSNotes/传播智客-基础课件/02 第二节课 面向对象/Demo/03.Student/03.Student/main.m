//
//  main.m
//  03.Student
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

/*
方法的重写必须满足两个条件：
  1.必须有继承
  2.方法名、参数列表 必须都一样
*/

int main(int argc, const char * argv[])
{
    
    Student *stu = [[Student alloc] init];
    [stu work];

    return 0;
}

