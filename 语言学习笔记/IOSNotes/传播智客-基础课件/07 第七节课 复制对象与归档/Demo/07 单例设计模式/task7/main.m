//
//  main.m
//  task7
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdressBook.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        AdressBook *book1 = [AdressBook shareInstance];
        AdressBook *book2 = [AdressBook shareInstance];
        AdressBook *book3 = [AdressBook shareInstance];
        AdressBook *book4 = [AdressBook shareInstance];
        NSLog(@"%p",book1);
        NSLog(@"%p",book2);
        NSLog(@"%p",book3);
        NSLog(@"%p",book4);
        [book1 retain];
        NSLog(@"%ld",[book1 retainCount]);
        
        NSZone *zone1 = NULL;
        AdressBook * adressBook1 = [AdressBook allocWithZone:zone1];
        NSLog(@"%ld",[adressBook1 retainCount]);
        
        
        AdressBook *book5 = [[AdressBook alloc] init];
        NSLog(@"book5=%p",book5);
        
        AdressBook *book6 = [book5 copy];
        NSLog(@"book6=%p",book6);
        
        [book6 release];
        [book6 release];
        [book6 release];
        [book6 release];
        
        
    }
    return 0;
}

