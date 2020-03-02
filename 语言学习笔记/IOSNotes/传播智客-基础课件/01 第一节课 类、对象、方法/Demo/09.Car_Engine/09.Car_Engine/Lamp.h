//
//  Lamp.h
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lamp : NSObject {
    NSInteger _wattage; //瓦数
}

- (id)initWithWattage:(float)wattage;

- (void)light;  //亮灯
- (void)dark;   //熄灯

@end
