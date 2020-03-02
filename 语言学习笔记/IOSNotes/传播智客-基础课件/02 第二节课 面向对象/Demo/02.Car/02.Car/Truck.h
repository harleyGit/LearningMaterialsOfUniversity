//
//  Truck.h
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Car.h"

//卡车类，继承汽车类
@interface Truck : Car {
    //最大载货量
    float _maxWeight;
}

//卸货
- (void)unload;

@end
