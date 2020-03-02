//
//  main.m
//  03 task3
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
        
        Children *chidren = [[Children alloc] init];
        
        Nurse *nures = [[Nurse alloc] initWithChildren:chidren];
        
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}

