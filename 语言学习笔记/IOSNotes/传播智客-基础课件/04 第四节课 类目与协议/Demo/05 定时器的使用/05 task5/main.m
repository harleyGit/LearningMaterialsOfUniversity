//
//  main.m
//  05 task5
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p = [[Person alloc] init];
    [p starTimer];

    //NSRunLoop 让程序始终处于运行状态
//    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    [runloop run];
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

