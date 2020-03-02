//
//  main.m
//  task7.2
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nure.h"
#import "Children.h"

#import "Nanny.h"

int main(int argc, const char * argv[])
{
    
    Children *child = [[Children alloc] init];
    //使用保姆
    Nure *nure = [[Nure alloc] init];    
    [child setNure:nure];
    
    //使用护士
//    Nanny *nanny = [[Nanny alloc] init];
//    [child setNanny:nanny];
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

