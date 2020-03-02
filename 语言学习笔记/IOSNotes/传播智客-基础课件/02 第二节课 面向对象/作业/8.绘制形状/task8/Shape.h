//
//  Shape.h
//  task8
//
//  Created by wei.chen on 12-12-13.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject {
@protected
    NSString *_name;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)draw;

@end
