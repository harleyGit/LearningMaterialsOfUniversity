//
//  main.m
//  task8
//
//  Created by wei.chen on 12-12-13.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"
#import "Square.h"
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Circle *circle = [[Circle alloc] init];
        circle.name = @"椭圆";
        
        Square *squ = [[Square alloc] init];
        squ.name = @"矩形";
        
        Person *p = [[Person alloc] init];
        
        [p paint:circle];
        
        //调用类方法
        [Person test];
        //[p test];
    }
    return 0;
}

