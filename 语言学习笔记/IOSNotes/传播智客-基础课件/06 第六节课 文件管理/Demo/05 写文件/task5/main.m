//
//  main.m
//  task5
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
/*___________________________NSString读、写文件_________________________________*/
        
        /*
        //1.NSString写文件
        NSString *s = @"无限互联___wxhl";
        
        //文件路径
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.text"];
        
        //将字符串写入文件
        BOOL success = [s writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        if (success) {
            NSLog(@"字符串写入成功！");
        }
        
        //2.NSString读文件
        //创建字符串对象时，同时读取文件路径对应的文件中的内容
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        //[[NSString alloc] initWithContentsOfFile:<#(NSString *)#> encoding:<#(NSStringEncoding)#> error:<#(NSError **)#>];
        NSLog(@"string=%@",string);
        */
        
        
/*___________________________NSData读、写文件_________________________________*/
        
        /*
        //1.NSData读文件
        //文件路径
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.text"];
        
        //创建NSData时，同时读取文件中的内容
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        
        
        [data release];
        [string release];
        
        //2.NSData写文件
        //[data writeToFile:<#(NSString *)#> atomically:<#(BOOL)#>];
        */
        
        
        
        /*
         注意：NSArray、NSDictionay 中只能存入NSNumber、NSString、NSData、NSDate、NSArray、NSDictionay
          才能成功写入文件、写入的文件我们称之为“属性列表文件”
         */
     
        
/*_____________________________NSArray读、写文件_____________________________*/
        
        //1.NSArray写文件
        /*
        NSString *s1 = @"zhangsan";
        NSString *s2 = @"李四";
        
        //文件路径
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
        
        NSArray *array = [[NSArray alloc] initWithObjects:s1,s2, nil];
        
        BOOL success = [array writeToFile:path atomically:YES];
        
        if (success) {
            NSLog(@"写入成功!");
        }
        
        [array release];
        */
        
        //数组、字典存入能存入NSNumber、NSString、NSData、NSDate、NSArray、NSDictionay 以外的对象，则无法写入文件
        /*
        [y arrayWithObjects:p,@"demo", nil];
        NSString *path2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array2.plist"];
        BOOL success2 = [array2 writeToFile:path2 atomically:YES];
        if (!success2) {
            NSLog(@"写入失败!!");
        }
        [p release];
        */
        
        
        //2.NSArray读文件
        /*
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
        NSArray *readArray = [[NSArray alloc] initWithContentsOfFile:path];
        for (NSString *s in readArray) {
            NSLog(@"s=%@",s);
        }
        */
        
        
/*___________________________NSDictionary读、写文件_________________________________*/
        
        /*
        //1.NSDictionary写入文件
        NSDictionary *dic = @{
                               @"name":@"jack",
                               @"birthday": [NSDate date],
                               @"age":@22
                            };
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dic.plist"];
        BOOL success = [dic writeToFile:path atomically:YES];
        if (success) {
            NSLog(@"写入成功");
        }
         */
        
        //2.NSDictionary 读文件
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dic.plist"];
        NSDictionary *readDic = [NSDictionary dictionaryWithContentsOfFile:path];
        NSLog(@"%@",readDic);
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
