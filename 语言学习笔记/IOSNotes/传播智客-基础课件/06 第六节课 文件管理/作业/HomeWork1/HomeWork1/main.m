//
//  main.m
//  HomeWork1
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.在Documents下创建一个文件“mobile.text”,内容为“iPhone、android、windows phone”，然后我们再次读取内容，并将内容修改为“iPhone、windows phone、android”，并且将文件名称改为“cellPhone.text”。然后我们在根目录下创建一个文件夹名为“phone”，在将文件剪切到该目录下。
*/

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"mobile.text"];
        NSString *s = @"iPhone、android、windows phone";
        BOOL success = [s writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (success) {
            NSLog(@"写入文件成功");
        }
        
        NSString *s2 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *array = [s2 componentsSeparatedByString:@"、"];
        
        NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];
        
        //下标为1、2的元素调换位置
        [array2 exchangeObjectAtIndex:1 withObjectAtIndex:2];
        
        //使用、链接数组中的元素
        NSString *newString = [array2 componentsJoinedByString:@"、"];

        //创建phone文件夹
        NSString *phonePath = [NSHomeDirectory() stringByAppendingPathComponent:@"phone"];
        [[NSFileManager defaultManager] createDirectoryAtPath:phonePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil error:nil];
        
        NSString *path2 = [NSHomeDirectory() stringByAppendingPathComponent:@"phone/cellPhone.text"];
        
        [newString writeToFile:path2 atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
    }
    return 0;
}

