//
//  Manager.h
//  04.Manager
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject {
    NSString *_username;    //用户名
    int _password;          //密码
}

- (void)setUsername:(NSString *)username;
- (NSString *)username;

- (void)setPassword:(int)password;
- (int)password;

//修改密码
- (BOOL)changePassword;

//显示管理的信息
- (void)showInfo;

@end
