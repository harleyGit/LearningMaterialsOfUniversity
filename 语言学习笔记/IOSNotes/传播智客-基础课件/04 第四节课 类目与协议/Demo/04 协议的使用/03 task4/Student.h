//
//  Student.h
//  03 task4
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WxhlProtocol.h"

@interface Student : NSObject <WxhlProtocol> //实现协议

//学习的方法
- (void)study;

@end
