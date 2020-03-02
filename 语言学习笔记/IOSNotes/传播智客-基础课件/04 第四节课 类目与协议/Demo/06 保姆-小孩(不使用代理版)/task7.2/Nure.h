//
//  Nure.h
//  task7
//
//  Created by wei.chen on 12-12-17.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"

//保姆类
@interface Nure : NSObject {
    Children *_children;
}

- (void)wash:(Children *)children;
- (void)play:(Children *)children;


@end
