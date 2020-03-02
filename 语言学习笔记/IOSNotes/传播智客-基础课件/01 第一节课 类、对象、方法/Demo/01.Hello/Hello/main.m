//
//  main.m
//  Hello
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

//OC中使用#import 导入一个头文件
#import <Foundation/Foundation.h>

//#include "<#header#>"  //C语言中使用#include 包含一个头文件

//main函数是OC程序的入口
int main(int argc, const char * argv[])
{

    //创建一个自动释放池
    @autoreleasepool {
        
        //把字符串@"Hello, World!" 在控制台打印出来
        //NSLog是OC里面特有的函数，NSLog打印是自动换行的
        //OC语言中的字符串用@“”表示, 如:@"Hello,World",OC中的字符串使用@指令表示
        //NS开头的都是OC里面的方法，所以大家以后打印，这个跟jobs成立的Next step公司有关系，现在见到NS开头的，二话不说 这就是OC里面的类
        NSLog(@"Hello, World!");
        NSLog(@"Hello, World!");
        
        
        //OC中的类型，int float double char等有一部分经过了重新typedef
        //OC中常用类型
        NSInteger s = 10;
        
        //布尔类型，表示"真"， “假”
        BOOL a = YES;
        BOOL b = true;

        //OC中的字符串类 NSString
        NSString *str = @"wxhl";
        
        //使用%@格式化占位符打印OC中的字符串
        NSLog(@"%@",str);
        
        //表示范围的结构体
        //NSRange rang = {0,5};
        
        //或者调用OC提供的函数来创建此结构体
        NSRange rang = NSMakeRange(0, 5);
    }
    return 0;
}

