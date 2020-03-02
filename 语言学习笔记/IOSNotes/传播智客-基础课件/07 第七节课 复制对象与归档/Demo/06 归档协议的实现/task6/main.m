//
//  main.m
//  task6
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //1.将person对象归档
        
        Person *p = [[Person alloc] init];
        p.name = @"张三";
        p.age = 20;
        p.apples = @[@"iphone",@"ipad"];
        
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];
        
        BOOL success = [NSKeyedArchiver archiveRootObject:p toFile:filePath];
        
        if (success) {
            NSLog(@"person归档成功");
        }
        
        
        //2.解归档，还原person对象
        
       
        NSString *filePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];
        
        Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath1];
        
        NSLog(@"person=%@",person); //调用[person description]
         
        
        
        
        Person *p1 = [[Person alloc] init];
        p1.name = @"张三";
        p1.age = 20;
        p1.apples = @[@"iphone",@"ipad"];

        Person *p2 = [[Person alloc] init];
        p2.name = @"张三";
        p2.age = 20;
        p2.apples = @[@"iphone",@"ipad"];
        
        
        //NSArray *array = @[p1,p2];
        
        
        
    }
    return 0;
}

