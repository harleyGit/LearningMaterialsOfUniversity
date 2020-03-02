//
//  main.m
//  04 task4
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"
#import "Nurse.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Children *chil = [[Children alloc] init];
        Nurse *nurse = [[Nurse alloc] init];
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}

