//
//  main.m
//  task7
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

/*__________________________使用NSFileHanle实现复制文件的功能_______________________________________*/

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *homePath = NSHomeDirectory();
        //源文件路径
        NSString *srcPath = [homePath stringByAppendingPathComponent:@"06 第六课 文件管理.pdf"];
        
        //目标文件路径
        NSString *targetPath = [homePath stringByAppendingPathComponent:@"Documents/06 第六课 文件管理.pdf"];
        
        
        /*
         注意：使用NSFileHandle只能读写已经存在的文件，不能创建文件
              使用NSFileManager创建文件
         */
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建目标文件
        BOOL success = [fileManager createFileAtPath:targetPath contents:nil attributes:nil];
        if (success) {
            NSLog(@"目标文件创建成功!");
        }
        
        //创建用于读取文件的NSFileHandle对象
        NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:srcPath];
        
        //创建用于写入的NSFileHandle对象
        NSFileHandle *wrteHandle = [NSFileHandle fileHandleForWritingAtPath:targetPath];
        
        //从当前偏移量读到文件的末尾，偏移量默认是起始位置
        //NSData *data = [readHandle readDataToEndOfFile];
        NSData *data = [readHandle availableData];
        
        //将数据写入目标文件
        [wrteHandle writeData:data];
        
        //关闭文件
        [readHandle closeFile];
        [wrteHandle closeFile];

    }
    return 0;
}

