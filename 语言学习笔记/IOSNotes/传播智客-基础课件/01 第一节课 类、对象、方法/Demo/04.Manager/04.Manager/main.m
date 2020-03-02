//
//  main.m
//  04.Manager
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager.h"

int main(int argc, const char * argv[])
{

    Manager *manager = [[Manager alloc] init];
    [manager setUsername:@"admin"];
    [manager setPassword:888888];
    
    //返回修改密码的结果
    BOOL result = [manager changePassword];
    
    //判断是否修改密码成功
    if (result) {
        //打印管理员的信息
        [manager showInfo];
    }
    
    
    return 0;
}

