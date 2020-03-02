//
//  main.m
//  task4
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

/*
 课堂练习：
 
 在沙盒的Documents目录下创建一个文件wxhl.text，将文本“无限互联”存入该文件，并且复制一个文件为wxhl_bak.text, 最后删除wxhl.text。
 */
int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/wxhl.text"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //1.创建一个文件wxhl.text
        NSString *string = @"无限互联";
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        BOOL success = [fileManager createFileAtPath:filePath
                                            contents:data
                                          attributes:nil];
        if (success) {
            NSLog(@"创建文件成功！");
        }
        
        
        //2.复制文件为wxhl_bak.text
        
        NSString *tagetPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/wxhl_bak.text"];
        success = [fileManager copyItemAtPath:filePath toPath:tagetPath error:nil];
        if (success) {
            NSLog(@"复制成功!");
        }
        
        
        //3.最后删除wxhl.text
        if ([fileManager fileExistsAtPath:filePath]) {
            success = [fileManager removeItemAtPath:filePath error:nil];
            if (success) {
                NSLog(@"删除成功!");
            }
        }
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
