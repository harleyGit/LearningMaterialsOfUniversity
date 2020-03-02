//
//  Children.h
//  task7
//
//  Created by wei.chen on 12-12-17.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class Nure;

//换成护士
@class Nanny;
@class Nure;

@interface Children : NSObject {
    int timeValue;
    
    //保姆
    Nure *_nure;
    
    Nanny *_nanny;
}

//- (void)setNure:(Nure *)nure;

- (void)setNanny:(Nanny *)nanny;



@end
