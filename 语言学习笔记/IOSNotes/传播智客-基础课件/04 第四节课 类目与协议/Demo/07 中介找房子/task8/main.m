//
//  main.m
//  task8
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agent.h"

int main(int argc, const char * argv[])
{

    Agent *ag = [[Agent alloc] init];
    
    Person *person = [[Person alloc] initWithDelegate:ag];
    
    [person findHouse];
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

