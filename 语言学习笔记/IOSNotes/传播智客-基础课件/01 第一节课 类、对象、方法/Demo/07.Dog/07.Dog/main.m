//
//  main.m
//  07.Dog
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{

    Person *p1 = [[Person alloc] initName:@"王五"];
    
    Dog *d1 = [[Dog alloc] initWithName:@"小黑" withColor:@"黑色"];
    
    //[p1 setDog:d1];
    p1.dog = d1;  //等价于[p1 setDog:d1];
    
    
    //调用遛狗方法
    [p1 playDog:11];
    
    return 0;
}

