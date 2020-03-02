//
//  User.m
//  03 task3
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "User.h"

@implementation User

//生成的属性名叫$userName， 而不是_userName
@synthesize userName = $userName;

//- (void)setUserName:(NSString *)userName {
//第一种形式：普通赋值  assign
//    _userName = userName;

//第二种形式：retain
//    if (_userName != userName) {
//        [_userName release];
//        _userName = [userName retain];
//    }
    
//第三种形式：copy    
//    if (_userName != userName) {
//        [_userName release];
//        _userName = [userName copy];
//    }

    
//}

- (void)showInfo {
    NSLog(@"用户名：%@",$userName);
}

@end
