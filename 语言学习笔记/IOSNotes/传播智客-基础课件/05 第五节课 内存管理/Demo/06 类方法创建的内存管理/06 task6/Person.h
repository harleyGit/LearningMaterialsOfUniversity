//
//  Person.h
//  06 task6
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@private
    NSString *_name;
}

+ (id)personWithName:(NSString *)name;


@end
