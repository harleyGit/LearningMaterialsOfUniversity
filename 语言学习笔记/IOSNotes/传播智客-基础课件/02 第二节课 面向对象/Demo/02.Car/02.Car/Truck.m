//
//  Truck.m
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Truck.h"

@implementation Truck

//卸货
- (void)unload {
    //继承下来的属性，_brand、_color 子类就可以直接使用了
    NSLog(@"%@的卡车卸货了，载重量：%0.2f，汽车颜色：%@",_brand,_maxWeight,_color);
}


@end
