//
//  main.m
//  task3
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"

int main(int argc, const char * argv[])
{
    //1.使用类目为NSString扩展一个方法，该方法可以返回一个倒置字符串。
    
    NSString *s = @"abcdef";
    
    NSString *newString = [s sortString];
    
    NSLog(@"%@",newString);
    
    return 0;
}

