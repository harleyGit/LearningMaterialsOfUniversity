//
//  main.m
//  01.Person
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p = [[Person alloc] init];
    
    //p->_age = 22;
    
//    p->_age = -22;
    
    //现在还是可以传-20啊，现在之所以对外提供访问方式，是因为可以在访问方法中加入逻辑判断
    //语句，是可以提高代码的安全性，健壮性. 哪就可以在setAge里面判断了。
    [p setAge:122];
    

    return 0;
}

