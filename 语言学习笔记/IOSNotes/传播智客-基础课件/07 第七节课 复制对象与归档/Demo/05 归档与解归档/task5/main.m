//
//  main.m
//  task5
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
/*____________________________第一种形式________________________________*/
        
        /****************对象归档********************/
        //对象------>文件
        
        /*
        NSArray *array = [NSArray arrayWithObjects:@"zhangsan",@"lisi",@"中文", nil];
        //归档保存的文件路径
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.arc"];
        
        //归档对象
        BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
        
        if (success) {
            NSLog(@"归档成功");
        }
        */
        
        
        /****************解归档********************/
        
        /*
        //文件----->对象
        //归档保存的文件路径
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.arc"];
        
        //解归档
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        for (NSString *s in array) {
            NSLog(@"%@",s);
        }
         */
        
        
/*____________________________第二种形式________________________________*/        
        
        /*
        
        NSArray *array = [NSArray arrayWithObjects:@"zhangsan",@"lisi",@"中文", nil];
        
        //此NSMutableData用于存储归档对象中的数据
        NSMutableData *data = [NSMutableData data];
        //创建归档对象
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        
        //编码数据和对象
        [archiver encodeObject:array forKey:@"array"];
        [archiver encodeInt:100 forKey:@"scope"];
        [archiver encodeObject:@"jack" forKey:@"name"];
        //....
        
        //完成归档，将归档数据填充至data中，此时data中已经存储了归档对象的数据
        [archiver finishEncoding];
        [archiver release];
        
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"ar.text"];
        //将归档数据写入文件
        BOOL success = [data writeToFile:filePath atomically:YES];
        if (success) {
            NSLog(@"arichiver success");
        }
         
        */
        
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"ar.text"];
        //读取归档数据
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        
        //创建解归档对象，对data中的数据进行解归档
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        
        //解归档，还原数据
        NSArray *array = [unarchiver decodeObjectForKey:@"array"];
        int scope = [unarchiver decodeIntForKey:@"scope"];
        NSString *name = [unarchiver decodeObjectForKey:@"name"];
        
        NSLog(@"array=%@",array);
        NSLog(@"scope=%d",scope);
        NSLog(@"name=%@",name);
        
    
    }
    return 0;
}

