//
//  Engine.h
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject {
    NSString *_model;   //型号
    float _capacity;    //排量
}


//自定义初始化方法
- (id)initWithModel:(NSString *)model WithCapacity:(float)capacity;

//转动
- (void)turn;
//停止转动
- (void)stopTrun;
 


@end
