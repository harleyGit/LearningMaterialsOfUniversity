//
//  WriteDate.h
//  HomeWork2
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriteDate : NSObject {
    NSFileHandle *fileHandle;
    NSInteger n;
}

- (void)runWrite;

@end
