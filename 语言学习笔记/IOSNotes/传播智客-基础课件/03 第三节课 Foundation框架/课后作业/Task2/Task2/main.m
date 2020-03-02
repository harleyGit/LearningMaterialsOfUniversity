//
//  main.m
//  Task2
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

//作业2
int main(int argc, const char * argv[])
{

    /*
     5.已知某学校的教学课程内容安排如下：
         老师                  课程
         Tom                 CoreJava
         John                Oracle
         Susan               Oracle
         Jerry               JDBC
         Jim                 Unix
         Kevin               JSP
         Lucy                JSP
     
     （1） 使用一个字典，以老师的名字作为键，老师教授的课程名作为值，表示上述课程安排。
     （2）增加了一位新老师Allen 教JDBC
     （3）Lucy 改为教CoreJava
     （4）遍历字典，输出所有的老师及老师教授的课程
     （5）利用字典，输出所有教JSP 的老师。
     */
    NSMutableDictionary *teachs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"CoreJava",@"Tom",
                                   @"Oracle",@"John",
                                   @"Oracle",@"Susan",
                                   @"JDBC",@"Jerry",
                                   @"Unix",@"Jim",
                                   @"JSP",@"Kevin",
                                   @"JSP",@"Lucy",
                                   nil];
    
    [teachs setObject:@"JDBC" forKey:@"Allen"];
    
    [teachs setObject:@"CoreJava" forKey:@"Lucy"];
    
    for (NSString *key in teachs) {
        NSString *cls = [teachs objectForKey:key];
        NSLog(@"老师：%@,课程：%@",key,cls);
    }
    
    
    NSArray *allkeys = [teachs allKeys];
    for (NSString *key in allkeys) {
        NSString *cls = [teachs objectForKey:key];
        if ([cls isEqualToString:@"JSP"]) {
            NSLog(@"教JSP的老师：%@",key);
        }
    }
    
    
    /*
     6.设计一个学生类Student, 有这些属性：name(姓名)、age(年龄)、score(分数)、(classNum)班级
     （1）将如下学生添加到数组中
             姓名	年龄	分数	班级
             Tom	17	82	Class01
             Jim	22	75	Class01
             Jerry	34	54	Class01
             Owen	22	98	Class04
             Steve	19	77	Class05     
     （2）计算所有学生的平均分
     （3）计算各个班级的平均分
     （4）用名字作为key,value是学生对象，将这些学生存入字典。
     */

    Student *s1 = [[Student alloc] init];
    s1.name = @"Tom";
    s1.age = 17;
    s1.score = 82;
    s1.classesName = @"Class01";
    
    Student *s2 = [[Student alloc] init];
    s2.name = @"Jim";
    s2.age = 22;
    s2.score = 75;
    s2.classesName = @"Class01";
    
    
    Student *s3 = [[Student alloc] init];
    s3.name = @"Jerry";
    s3.age = 34;
    s3.score = 54;
    s3.classesName = @"Class01";
    
    
    Student *s4 = [[Student alloc] init];
    s4.name = @"Owen";
    s4.age = 22;
    s4.score = 98;
    s4.classesName = @"Class04";
    
    
    Student *s5 = [[Student alloc] init];
    s5.name = @"Steve";
    s5.age = 19;
    s5.score = 77;
    s5.classesName = @"Class05";
    
    NSArray *students = [NSArray arrayWithObjects:s1,s2,s3,s4,s5, nil];
    
    //（2）计算所有学生的平均分
    float sum = 0;
    for (Student *stu in students) {
        sum += stu.score;  //[stu score];
    }
    float avg = sum / students.count;
    NSLog(@"所有学生的平均分:%f",avg);
    
    //（3）计算各个班级的平均分
    //students: [学生1，学生2，学生3，....];
    
    /*
       {
          @"class01":["学生1"，学生2]，
          @“class02”:["学生3"]
       }
     */
    
    NSMutableDictionary *stuDic = [NSMutableDictionary dictionary];
    for (Student *stu in students) {
        NSString *classesName = stu.classesName;  //学生的所在班级
        //class02
        NSMutableArray *stuArray = [stuDic objectForKey:classesName];
        if (stuArray == nil) {
            stuArray = [[NSMutableArray alloc] init];
            [stuDic setObject:stuArray forKey:classesName];
        }
        [stuArray addObject:stu];
    }
    
    NSLog(@"stuDic = %@",stuDic);
    
    
    for (NSString *classesName in stuDic) {
        NSArray *stuArray = [stuDic objectForKey:classesName];
        
        float sum = 0;
        for (Student *stu in stuArray) {
            sum += stu.score;
        }
        float avg = sum/stuArray.count;
        NSLog(@"班级：%@的平均分:%f",classesName,avg);
    }
    
    
    
    
    return 0;
}

