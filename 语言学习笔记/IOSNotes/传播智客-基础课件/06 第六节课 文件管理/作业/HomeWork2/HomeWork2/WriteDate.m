//
//  WriteDate.m
//  HomeWork2
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "WriteDate.h"

@implementation WriteDate
- (void)runWrite {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Date.text"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建Date.text
    BOOL success = [fileManager createFileAtPath:path contents:nil attributes:nil];
    if (success) {
        NSLog(@"创建Date.text成功");
    }
    
    //注意：全局的对象必须retain，拿到此对象的对象所有权
    fileHandle = [[NSFileHandle fileHandleForWritingAtPath:path] retain];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil repeats:YES];
}
- (void)timerAction:(NSTimer *)timer {    
//    NSFileHandle *fileHandle = timer.userInfo;
    
    //获取当前日期对象
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    //设置日期的格式:2012/02/14 05:20:00
    [dateFormate setDateFormat:@"yyyy/MM/dd HH:mm:ss \n"];
    NSString *datestring = [dateFormate stringFromDate:date];
    [dateFormate release];
    
    NSData *data = [datestring dataUsingEncoding:NSUTF8StringEncoding];
    //将偏移量设置到文件的末尾
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:data];
    n++;
    if (n == 10) {
        //终止定时器
        [timer invalidate];
        //关闭文件
        [fileHandle closeFile];
    }
}
- (void)dealloc {
    [fileHandle release];
    [super dealloc];
}
@end
