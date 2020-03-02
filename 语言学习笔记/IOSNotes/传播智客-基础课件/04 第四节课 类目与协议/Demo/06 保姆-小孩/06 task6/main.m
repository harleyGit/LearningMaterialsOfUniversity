//
//  main.m
//  06 task6
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"
#import "Nure.h"
#import "Nanny.h"

int main(int argc, const char * argv[])
{

    Children *chil = [[Children alloc] init];
    
    Nure *nure = [[Nure alloc] init];
    
    Nure *nure1 = [[Nure alloc] init];
    
    [chil setDelegate:nure];
    [chil setDelegate:nure1];
    
 //   [chil setNure:nure];
    
    
//    Nanny *nany = [[Nanny alloc] init];
//    [chil setDelegate:nany];
    
    
    
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

