//
//  main.m
//  task3
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
/*___________________________1.创建文件_____________________________*/
       /*
        //获取当前app的沙盒根目录
        NSString *homePath = NSHomeDirectory();
        
        //追加子路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];

        
        NSString *string = @"无限互联";
        //将NSString转成NSData对象
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        //NSFileManager 不能使用alloc创建，这个类设计为单实例
        //NSFileManager *fileM = [[NSFileManager alloc] init];
        
        //NSFileManager 只能通过类方法defaultManager 创建
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //根据路径filePath创建对应的文件，注意：只能创建文件，不能创建目录(文件夹)
        BOOL success = [fileManager createFileAtPath:filePath
                                            contents:data
                                          attributes:nil];
        
        
        if (success) {
            NSLog(@"文件创建成功");
        } else {
            NSLog(@"文件创建失败");
        }
        
        
        //创建文件夹
        NSString *filePath2 = [homePath stringByAppendingPathComponent:@"Documents/demo"];
        NSError *error;
        BOOL suucces2 = [fileManager createDirectoryAtPath:filePath2
                               withIntermediateDirectories:YES
                                                attributes:nil
                                                     error:&error];
        if (!suucces2) {
            NSLog(@"创建失败:%@",error);
        }
        */
        
        
/*___________________________2.读取文件_____________________________*/
        
        
        //获取当前app的沙盒根目录
        NSString *homePath = NSHomeDirectory();
        
        //追加子路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //根据路径读取文件中的数据
        NSData *data = [fileManager contentsAtPath:filePath];
        
        //NSData 转 NSString
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
         
        
/*___________________________3.移动(剪切)文件_____________________________*/
        
        /*
        //获取当前app的沙盒根目录
        NSString *homePath = NSHomeDirectory();
        
        //源路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];

        //目标路径
        NSString *tagetPath = [homePath stringByAppendingPathComponent:@"Documents/demo/file2.text"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
         //moveItemAtPath: 移动文件
        BOOL success = [fileManager moveItemAtPath:filePath toPath:tagetPath error:nil];
        if (!success) {
            NSLog(@"移动失败！！");
        }
        */
        
/*___________________________4.复制文件_____________________________*/
        
        /*
        //获取当前app的沙盒根目录
        NSString *homePath = NSHomeDirectory();
        
        //源路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/demo/file3.text"];
        
        //目标路径
        NSString *tagetPath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
         //copyItemAtPath: 将源文件复制到目标路径
        BOOL success = [fileManager copyItemAtPath:filePath toPath:tagetPath error:nil];
        if (!success) {
            NSLog(@"复制失败！！");
        }
         */
        
/*___________________________5.删除文件_____________________________*/
        
        /*
        //获取当前app的沙盒根目录
        NSString *homePath = NSHomeDirectory();
        
        //源路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/demo/file3.text"];
        
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //判断文件是否存在
        BOOL fileExist = [fileManager fileExistsAtPath:filePath];
        
        if (fileExist) {
            
            //removeItemAtPath：删除文件
            BOOL success = [fileManager removeItemAtPath:filePath error:nil];
            if (success) {
                NSLog(@"删除成功!!");
            }
        }
         */
        
/*___________________________6.获取文件的属性_____________________________*/
        /*
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *homePath = NSHomeDirectory();
                
        //目标路径
        NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];
        
        //获取到文件的属性信息，文件的属性信息存储fileAttr字典中
        NSDictionary *fileAttr = [fileManager attributesOfItemAtPath:filePath error:nil];
        
        NSLog(@"%@",fileAttr);
        //从字典中通过key:NSFileSize 获取到文件大小
        NSNumber *filesize = [fileAttr objectForKey:NSFileSize];
        long sizeValue = [filesize longValue];
        NSLog(@"文件大小:%ld",sizeValue);
        
        
        //如下读取文件的大小，不可取，因为将文件中的数据全都读到内存中，文件大时，太占用内存了
        //NSData *data = [fileManager contentsAtPath:filePath];
        //NSInteger len = data.length;
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
         */
    }
}
