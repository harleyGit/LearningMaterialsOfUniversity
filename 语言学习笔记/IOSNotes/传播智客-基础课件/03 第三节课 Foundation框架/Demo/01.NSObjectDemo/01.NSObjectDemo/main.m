//
//  main.m
//  01.NSObjectDemo
//
//  Created by wei.chen on 13-7-27.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    //isEqualTo 判断两个对象是否为同一个对象
    NSObject *obj1 = [[NSObject alloc] init];
    NSObject *obj2 = [[NSObject alloc] init];
    
    if (![obj1 isEqualTo:obj2]) {
        NSLog(@"不匹配");
    }
    
/*______________________演示perform的使用___________________________*/
    Person *p = [[Person alloc] init];
    [p invoke];
    
/*______________________Class___________________________*/
    //获取Person类的描述
    Class pClass = [Person class]; //class是从NSObject继承下来的类方法
    Class p2Class = [p class];
    
    //获取Person父类的描述
    Class sClass = [Person superclass];
    Class s2Class = [p superclass];
    
    
/*______________________isKindOfClass与isMemberOfClass___________________________*/
    //创建一个Person对象
    Person *rose = [[Person alloc] init];
    //判断rose对象是否是属于Person类
    if ([rose isKindOfClass:[Person class]]) {
        NSLog(@"rose 是 Person 类");
    }
    //也可以判断rose是否为NSObject的子类对象
    if ([rose isKindOfClass:[NSObject class]]) {
        NSLog(@"rose是NSObject的子类对象");
    }
    //判断rose是否是Person创建的
    if ([rose isMemberOfClass:[Person class]]) {
        NSLog(@"rose是Person创建的");
    }
    //rose对象不属于NSObject类创建的，所以不满足条件
    if ([rose isMemberOfClass:[NSObject class]]) { //不满足条件
    }
    
/*______________________respondsToSelector___________________________*/        
    //创建一个Person对象
    Person *jack = [[Person alloc] init];
    
    //判断对象jack中是否有invoke此方法
    if ([jack respondsToSelector:@selector(invoke)]) {
        NSLog(@"有invoke方法");
    }
    
    //注意invoke与invoke:是两种方法
    if ([jack respondsToSelector:@selector(invoke:)]) {
        NSLog(@"有invoke:方法");
        
        //如果jack有invoke:方法，则调用，这样程序更加严谨
        //[jack invoke:"test"];
    }
    
    
    
    return 0;
}

