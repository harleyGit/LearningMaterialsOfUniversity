//
//  main.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"
#import "Student.h"

/*
  1.多release, 导致调用野指针，导致程序挂掉
  2.少release, 导致内存泄露，对象不会被销毁掉
 */

int main(int argc, const char * argv[])
{
    
    Dog *dog1 = [[Dog alloc] init]; //引用计数为1
    dog1.name = @"小黑";
/*
    Person *p = [[Person alloc] init];  //引用计数为1
    
    p.name = @"张三";
    [p setDog:dog1];  //dog计数：2
    
    [dog1 release];  //dog计数：1
    
    [p release];    //person：0    
*/
    
    /*
    Person *p = [[Person alloc] initWithDog:dog1]; //dog计数：2
    
    [p playDog]; //dog计数：1
    
    [dog1 release];  //dog计数：0 狗销毁了
    
    [p release];
     */
    
    Student *stu = [[Student alloc] init];
    [stu setDog:dog1];
    
    [stu playDog];
    
    [stu release];
    [dog1 release];
    
    return 0;
}

