//
//  main.m
//  01 task1
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Person *p = [[Person alloc] init];
        //通过kvc对属性设值
        [p setValue:@"jack" forKey:@"name"];
        //NSLog(@"%@",p);
        
        //基本数据类型设值，得转成NSNumber
        [p setValue:@22 forKey:@"age"];
        NSLog(@"%@",p);        
        
        //通过kvc获取属性值
        NSString *name = [p valueForKey:@"name"];
        NSLog(@"name=%@",name);
        
        
        Dog *dog1 = [[Dog alloc] init];
        NSLog(@"dog1计数：%ld",dog1.retainCount);
        [p setValue:dog1 forKey:@"dog"];  //通过kvc设值对象，此对象会被retain
        NSLog(@"dog1计数：%ld",dog1.retainCount);
        
        /*
          kvc设值时，如果此属性有set方法，则优先调用set方法，如果没有则直接设置上去
          get方法也是一样的
         */        
    }
    return 0;
}

