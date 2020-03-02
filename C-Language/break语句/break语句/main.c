//
//  main.c
//  break语句
//
//  Created by 黄刚 on 2016/12/11.
//  Copyright © 2016年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    
    double pi = 3.1415926;
    float area = 0;
    float r;
    
    for (r = 1; r <=10; r++)
    {
        area = pi * r * r;
//        printf("--->r = %f,area = %f \n" ,r,area);
        if (area > 100)
            break;
            printf("r = %f,area = %f \n" ,r,area);//f的含义是float，用来输出实数。以小数形式输出单双精度数，含6位小数
        
    }
    
    printf("Hello, World!\n");
    return 0;
}
