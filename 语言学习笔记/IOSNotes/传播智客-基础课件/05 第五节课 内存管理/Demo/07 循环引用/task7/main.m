//
//  main.m
//  task7
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
    
    Person *p = [[Person alloc] init];  //person计数： 1
    Dog *dog = [[Dog alloc] init];      //dog计数：1
    
    [p setDog:dog];  //dog计数：2
    
    [dog setPerson:p]; //person计数:2
    
    [p release];     //person计数：1
    [dog release];   //dog计数：1
    
    NSLog(@"over");
    
    return 0;
}

