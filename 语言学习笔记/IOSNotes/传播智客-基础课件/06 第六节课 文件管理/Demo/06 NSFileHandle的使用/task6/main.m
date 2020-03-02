//
//  main.m
//  task6
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
/*___________________________1.追加数据_____________________________*/
        
        /*
        NSString *s = @"无限互联3G学院";
    
        //当前登陆用户的主目录
        NSString *homePath = NSHomeDirectory();
    
        NSString *path = [homePath stringByAppendingPathComponent:@"file.text"];
        
        //写入文件
        [s writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        */
        
        /*
        NSString *homePath = NSHomeDirectory();        
        NSString *path = [homePath stringByAppendingPathComponent:@"file.text"];
        
        //创建一个写入的NSFileHandle对象
        NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        
        //将文件的偏移量设置到末尾，写入文件时则从末尾开始写入
        [writeHandle seekToEndOfFile];
        
        NSString *appendString = @"追加的数据";
        NSData *data = [appendString dataUsingEncoding:NSUTF8StringEncoding];
        
        //从当前偏移量开始写入数据
        [writeHandle writeData:data];
        
        //关闭文件
        [writeHandle closeFile];
         */
        
/*___________________________2.定位读取_____________________________*/
        
        //当前登陆用户的主目录
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingPathComponent:@"file.text"];
        
        //通过NSFileManager获取文件的大小
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDictionary *fileAttr = [fileManager attributesOfItemAtPath:path error:nil];
        NSNumber *fileSize = [fileAttr objectForKey:NSFileSize];
        long long sizeValue = [fileSize longLongValue];
        
        NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:path];
        //将偏移量设置到中间位置
        [readHandle seekToFileOffset:sizeValue/2];
        
        //从当前偏移量读取到文件的末尾
        NSData *data = [readHandle readDataToEndOfFile];
        
        //NSData ----> NSString
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",string);
        
        [string release];
        
        
    }
    return 0;
}

