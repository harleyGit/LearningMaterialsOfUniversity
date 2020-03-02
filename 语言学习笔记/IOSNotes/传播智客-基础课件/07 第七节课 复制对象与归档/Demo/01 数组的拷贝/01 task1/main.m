//
//  main.m
//  01 task1
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 */
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
/*__________________________对数组进行retain_____________________________*/
        /*
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two", nil];
        //retain只是引用计数+1,没有创建新的对象
        //array1与array2指针相同，指向同一个对象
        NSMutableArray *array2 = [array1 retain];
        
        if (array1 == array2) {
            NSLog(@"array1 == array2");
            NSLog(@"array1的引用计数：%ld",array1.retainCount);
        }
         */
        
/*__________________________对数组进行copy_____________________________*/
        
        /*
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two", nil];
        [array1 retain];  //引用计数:2
        
        //复制对象，创建一个新的副本对象
        NSArray *array2 = [array1 copy]; //array2计数为：1，因为是新创建出来的对象
        
        if (array1 != array2) {
            NSLog(@"array1 != array2,是两个对象");
            
            NSLog(@"array1的引用计数：%ld",array1.retainCount);
            NSLog(@"array2的引用计数：%ld",array2.retainCount);
        }
        
        [array2 release];
        [array1 release];
        */
        
/*__________________________copy与mutableCopy的区别_____________________________*/
        
        /*
         copy与 mutableCopy都是复制对象，都能复制一个新的副本对象出来
         copy复制出来的对象，是不可变的对象
         mutableCopy复制出来的对象，是可变的对象
        */
        
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two", nil];
        
        //copy复制出来的对象是不可变的
        NSArray *array2 = [array1 copy];
        
        //mutableCopy 复制出来的对象是可变
        NSMutableArray *array3 = [array1 mutableCopy];
        [array3 addObject:@"three"];
        
        NSLog(@"array3=%@",array3);
        
        
        //NSNumber *number = @123;
        //NSNumber没有实现NSMutableCopying协议
        //[number mutableCopy];  //错误
        
    }
    return 0;
}

