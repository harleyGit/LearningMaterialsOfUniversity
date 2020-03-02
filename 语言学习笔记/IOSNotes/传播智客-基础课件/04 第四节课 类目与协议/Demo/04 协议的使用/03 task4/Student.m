//
//  Student.m
//  03 task4
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Student.h"

@implementation Student

//学习的方法
- (void)study {
    NSLog(@"爱学习");
}

#pragma mark - WxhlProtocol协议方法
//完成作业的协议方法
- (void)finishTask {
    NSLog(@"每天我都按时高质量的完成作业");
}

//不能迟到
- (void)dontLate {
//#warning 代码过几天在补充
    NSLog(@"早上6点起床，7点到教室，8点完成预习");
}

//着装整洁
//- (void)wearNeat {
//    NSLog(@"每天穿新衣服");
//}

@end
