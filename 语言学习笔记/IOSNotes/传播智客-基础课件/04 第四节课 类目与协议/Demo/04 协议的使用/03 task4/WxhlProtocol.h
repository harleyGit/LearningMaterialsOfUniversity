//
//  WxhlProtocol.h
//  03 task4
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WxhlProtocol <NSObject>

@required  //必须实现的协议方法， 默认就是@required

//完成作业的协议方法
- (void)finishTask;

//不能迟到
- (void)dontLate;

//...

@optional //可选实现的方法

//着装整洁
- (void)wearNeat;


@end
