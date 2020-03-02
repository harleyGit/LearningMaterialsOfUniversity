//
//  Agent.h
//  task8
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Agent : NSObject<PersonDelegate> {
    NSString *_name;
}

- (NSString *)name;

@end
