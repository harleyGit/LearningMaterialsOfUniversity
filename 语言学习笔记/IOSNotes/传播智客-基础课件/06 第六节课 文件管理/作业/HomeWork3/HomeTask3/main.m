//
//  main.m
//  HomeTask3
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 复制一个大型文件，为了节约内存，每次只读取5000个字节。
 */
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        //需要复制的文件：09 NSFileHandle实现复制功能.screenflow
        
        NSString *homePath = NSHomeDirectory();
        //要复制的源文件路径
        NSString *srcPath = [homePath stringByAppendingPathComponent:@"09 NSFileHandle实现复制功能.screenflow.zip"];
        //目标文件路径
        NSString *tagetPath = [homePath stringByAppendingPathComponent:@"09 NSFileHandle实现复制功能_bak.screenflow.zip"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建目标文件
        BOOL success = [fileManager createFileAtPath:tagetPath contents:nil attributes:nil];
        if (success) {
            NSLog(@"create success");
        }
        
        NSDictionary *fileAtt = [fileManager attributesOfItemAtPath:srcPath error:nil];
        NSNumber *fileSizeNum = [fileAtt objectForKey:NSFileSize];
        
        //源文件大小
        long long filesize = [fileSizeNum longLongValue];
    
        //用于读的Handle
        NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:srcPath];
        NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:tagetPath];
        
        NSInteger readSize = 0; //已读的文件大小
        BOOL isEnd = NO;
        
        NSAutoreleasePool *pool = nil;
        int n = 0;
        
        while (!isEnd) {
            
            if (n % 100 == 0) {
                [pool release];
                pool = [[NSAutoreleasePool alloc] init];
            }
            
            //未读的文件大小
            NSInteger subSize = filesize - readSize;
            
            NSData *data = nil;
            if (subSize < 5000) {
                data = [readHandle readDataToEndOfFile];
                isEnd = YES;
            } else {
                data = [readHandle readDataOfLength:5000];
                //累加已经读取的文件大小
                readSize += 5000;                
            }
            
            [writeHandle writeData:data];
            n++;
        }
        
        //关闭文件
        [writeHandle closeFile];
        
    }
    return 0;
}

