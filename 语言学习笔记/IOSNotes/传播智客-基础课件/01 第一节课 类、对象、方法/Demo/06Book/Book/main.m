//
//  main.m
//  Book
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

int main(int argc, const char * argv[])
{

    Book *b = [[Book alloc] initWithTitle:@"西游记" withPageNum:500];
    [b showDetail];
    
    [b setTitle:@"西游记续集" pageNum:1000];
    //set方法可以多次调用
    [b setTitle:@"西游记续集2" pageNum:1500];
    
    //[b setTitle:@"wxhl"];
    b.title = @"wxhl";  //点语法在=号的左边调用设置器方法，等价于[b setTitle:@"wxhl"];
    
    NSString *title = b.title; //点语法在=号右边调用的是访问器，等价于[b title];
    NSLog(@"title=%@",title);
    
    
    //点语法只能调用设置器、访问器方法
    //b.initWithTitle; //错误
    
    //b.showDetail = @"xxx";  //[b setShowDetail:];  //错误
    
    //b.title --> [b setTitle:@""];  //注意：title不是属性名
    
//    NSString *s = b.showDetail; //[b showDetail];
//    NSLog(@"s = %@",s);
    
    return 0;
}

