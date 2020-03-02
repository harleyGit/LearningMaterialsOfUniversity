//
//  NSString+Extension.m
//  task1
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)validateEmail {
    //查找是否有@符号，有的话验证通过，反之不通过
    
    //查找字符串
    NSRange rang = [self rangeOfString:@"@"];
    
    if (rang.location == NSNotFound) {
        
        return NO;
    }
    
    return YES;
}

//通过类目覆写NSString的方法
//覆写此方法之后，原始类的intValue方法则无法调用了
- (int)intValue {
    
    NSLog(@"intValue");
    return 100;
}


@end
