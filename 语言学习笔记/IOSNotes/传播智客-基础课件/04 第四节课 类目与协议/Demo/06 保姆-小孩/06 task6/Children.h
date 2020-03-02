//
//  Children.h
//  06 task6
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Children;

//照顾小孩的协议
@protocol ChildrenDelegate <NSObject>

@required
//帮小孩洗澡
- (void)wash:(Children *)children;
//逗小孩玩
- (void)play:(Children *)children;

@end


@interface Children : NSObject {
    
    //Nure *_nure;  //保姆
    //Nanny *_nanny;
    
    //代理(委托)对象
    id<ChildrenDelegate> _delegate;
    
    NSInteger timeValue;
    
}

//- (void)setNure:(Nure *)nure;
//- (void)setNanny:(Nanny *)nanny;

- (void)setDelegate:(id<ChildrenDelegate>)delegate;

@end
