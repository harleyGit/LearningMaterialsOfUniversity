//
//  Nanny.m
//  06 task6
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Nanny.h"
//#import "Children.h"

@implementation Nanny

//照顾小孩的协议方法
//帮小孩洗澡
- (void)wash:(Children *)children {
     NSLog(@"小孩脏了，护士帮小孩洗澡了");
}
//逗小孩玩
- (void)play:(Children *)children {
    NSLog(@"小孩哭了，护士逗小孩玩了");
}

@end
