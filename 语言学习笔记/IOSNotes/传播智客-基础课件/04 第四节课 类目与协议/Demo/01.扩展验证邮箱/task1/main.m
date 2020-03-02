//
//  main.m
//  task1
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ExtensionString.h"

#import "NSString+Extension.h"

int main(int argc, const char * argv[])
{

    //不使用类目，只能通过继承NSString扩展新的方法
    /*
    ExtensionString *str = [[ExtensionString alloc] initWithString:@"123456@qq.com"];
    
    BOOL isEmail = [str validateEmail];
    
    if (isEmail) {
        NSLog(@"验证通过");
    } else {
        NSLog(@"邮箱不合法");
    }
     */
    
    
    //使用类目，为现有的类NSString扩展方法
    NSString *s = @"123456&qq.com";
    
    BOOL isEmail = [s validateEmail];
    if (isEmail) {
        NSLog(@"验证通过");
    } else {
        NSLog(@"邮箱不合法");
    }
    
    //优先调用类目覆写的intValue方法
    int len = [s intValue];
    NSLog(@"len=%d",len);
    
    /*
     类目的不足
     1.类目还可以覆写现有类的方法。覆写后，原始方法则无法调用。
     2.类目不能为类扩展实例属性。
     */
    
    return 0;
}

