//
//  Manager.m
//  04.Manager
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (void)setUsername:(NSString *)username {
    _username = username;
}

- (NSString *)username {
    return _username;
}

- (void)setPassword:(int)password {
    _password = password;
}

- (int)password {
    return _password;
}

//修改密码
- (BOOL)changePassword {
    
    NSLog(@"请输入旧密码：");
    int oldPass;
    scanf("%d",&oldPass);
    
    
    //newPassword 新密码
    //旧密码 和 当前密码 匹配时才允许修改
    if (oldPass == _password) {
        NSLog(@"请输入新的密码：");
        int newPass;
        scanf("%d",&newPass);
        
        _password = newPass;
        
        NSLog(@"修改成功");
        return YES;
    }
    
    NSLog(@"密码不匹配，修改失败");
    
    return NO;
    
}

//显示管理的信息
- (void)showInfo {
    NSLog(@"管理员信息： %@     %d",_username,_password);
}


@end
