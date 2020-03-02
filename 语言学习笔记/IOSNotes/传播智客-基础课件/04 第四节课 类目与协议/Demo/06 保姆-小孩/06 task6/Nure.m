//
//  Nure.m
//  06 task6
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Nure.h"
//#import "Children.h"

@implementation Nure

//照顾小孩的协议方法
- (void)wash:(Children *)children {
    NSLog(@"小孩脏了，保姆帮小孩洗澡了");
}

//和小孩玩耍的方法
- (void)play:(Children *)children {
    NSLog(@"小孩哭了，保姆逗小孩玩了");
}


@end
