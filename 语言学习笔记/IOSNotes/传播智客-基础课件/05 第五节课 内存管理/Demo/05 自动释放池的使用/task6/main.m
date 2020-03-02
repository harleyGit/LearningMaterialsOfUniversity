//
//  main.m
//  task6
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[])
{
    
    /*
    Dog *dog1 = [[Dog alloc] init];  //计数：1
        
    //创建一个自动释放池
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    //将dog1对象加入到自动释放池，autorelease 不是将dog1的计数-1
    [dog1 autorelease];
    //[pool addObject:dog1];
    NSLog(@"dog1计数：%ld",dog1.retainCount);
    
    //当自动释放池销毁的时候，会对池子中的每一个对象发送release消息(调用了release方法)
    [pool release];
    
    //会对池子中的每一个对象发送release消息(调用了release方法)
    //但是pool对象没有销毁
    //[pool drain];
    
    
    @autoreleasepool {  //等价于 [[NSAutoreleasePool alloc] init];
        
        //dog2变量只能在{}作用域中有效
        Dog *dog2 = [[Dog alloc] init];
        
        [dog2 autorelease];
        
    }  //等价于 [pool release];
     */
    
        /*________________________自动释放池的嵌套___________________________*/
    
    NSAutoreleasePool *pool1 = [[NSAutoreleasePool alloc] init];

    Dog *dog1 = [[Dog alloc] init];
    dog1.name = @"小黑";
    //dog1添加到自动释放池pool1中
    [dog1 autorelease];
    
    
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
    Dog *dog2 = [[Dog alloc] init];
    dog2.name = @"大黄";
    //dog2添加到自动释放池pool2中
    [dog2 autorelease];
    
    [pool2 release];
    
    [pool1 release];
    
    
    
    /*______________________使用自动释放池优化内存_____________________________*/

    /*
    NSAutoreleasePool *pool3 = [[NSAutoreleasePool alloc] init];
     //for循环之后，创建了1000000个dog对象，加入到自动释放池，太占用内存了
    for (int i=0; i<1000000; i++) {
        Dog *dog3 = [[Dog alloc] init];
        [dog3 autorelease];
    }
    [pool3 release];
    */
    
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    for (int i=0; i<1000000; i++) {
        //每隔1000次，释放掉池子中的对象，这样池子中同时存在的对象不会超过1000个
        if (i % 1000 == 0) {
            
            //释放掉池子中所有的对象
            [pool drain];
        }
        
        Dog *dog3 = [[Dog alloc] init];
        [dog3 autorelease];
    }
    
    [pool release];
    
    return 0;
}

