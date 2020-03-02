//
//  main.m
//  02 task2
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 浅拷贝：只复制对象本身，此对象所持有的对象不做复制
 深拷贝：不仅仅复制对象本身，所持有的对象也会复制给副本对象
 */
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:2];
        //创建2个对象，添加到数组中
        for (int i=0; i<2; i++) {
            Person *p = [[Person alloc] init];
            [array1 addObject:p];
            [p release];
        }
        
        
        //复制之前数组中对象的引用计数
        for (Person *p in array1) {
            NSLog(@"复制之前的引用计数：%ld",p.retainCount);
            NSLog(@"复制之前的指针：%p",p);
        }
        

        NSLog(@"-----------------------------------------------");
        //复制数组，array2是新复制出来的副本对象
        NSArray *array2 = [array1 copy];
    
        //副本对象中的元素的引用计数
        for (Person *p in array2) {
            NSLog(@"复制之后的引用计数：%ld",p.retainCount);
            NSLog(@"复制之后的指针：%p",p);
        }
        
        /*
         结论：
         1.数组复制出来的副本对象，副本对象中的元素只是引用计数+1
           说明此副本对象只是对所持有的元素对象retain，而没有复制
         2. 数组的拷贝是浅拷贝
        */
        
    }
    return 0;
}

