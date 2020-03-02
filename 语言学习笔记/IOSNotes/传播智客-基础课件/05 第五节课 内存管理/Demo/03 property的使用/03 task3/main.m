//
//  main.m
//  03 task3
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[])
{
    
    User *user = [[User alloc] init];
//    user.userName = @"admin";
    [user setUserName:@"admin"];
    
    [user showInfo];
    
    return 0;
}

