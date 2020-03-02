//
//  main.m
//  08.Import
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//import不会重复导入头文件
#import "Student.h"
#import "Student.h"  //没有问题，第二次导入时，#import会判断，如果之前导入了，这次就不导入了

//#include 会造成重复导入头文件
//#include "Student.h"
//#include "Student.h"   //错误

/*
 #include 重复导入等价于拷贝了两次文件中的内容
@interface Student : NSObject

@end

@interface Student : NSObject

@end
 */

int main(int argc, const char * argv[])
{
    
    Student *stu = [[Student alloc] init];
    [stu study];
    
    
    return 0;
}

