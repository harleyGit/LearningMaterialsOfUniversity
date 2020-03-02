//
//  main.c
//  结构体
//
//  Created by 黄刚 on 2017/2/5.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <mm_malloc.h>


#define N 3
#define LEN sizeof(struct student_one)//sizeof是求字节数的运算符，即结构体struct student_one长度
typedef struct Tool{
    char    eraser[10];
    char    knife[20];
}LearnTools;

typedef struct Stdudent{
    char    number[20];     //学号
    char    name[20];       //姓名
    char    sex[5];         //性别
    int     age;            //年龄
} Apprentice;





int main(int argc, const char * argv[]) {
    Apprentice student = {
        .number = "20191038",
        .name = "hello",
        .sex = "male",
        .age = 25,
    };
    
    
    printf("numger: %s, name: %s, sex: %s, age: %d\n", student.number, student.name, student.sex, student.age);
    
    
    system("pause");
    
    void outputStudentInformation();
    void compareStudentScore();
    void dePiaoshu();
    void 指向结构体数组的指针();
    void outputTheHighestAverageScore();
    void buildList();
    void toEstablishTheDynamicLinkedList();
    void enumType();
    void tabllColor();
    
    
    
    
    
//    输出学生信息
//    outputStudentInformation();
    
//    比较学生的信息
//    compareStudentScore();
    
//    结构体数组----投票选举
//    dePiaoshu();
    
//    指向结构体数组的指针();
    
//    用结构体变量或结构体变量的指针做函数参数
//    outputTheHighestAverageScore();
    
//    建立简单链表
//    buildList();
    
//    建立动态链表
//    toEstablishTheDynamicLinkedList();
    
//    使用枚举类型
//    enumType();

//    枚举求3次球的颜色
//    tabllColor();

    
    
    printf("\n");
    return 0;
}

void outputStudentInformation()
{
//    extern  Date;
    struct Date
    {
        int year;
        int month;
        int day;
    };
    
    struct Student
    {
        long num;
        char name[20];
        char sex;
        char addr[50];
        struct Date birthday;  //成员birthday属于struct Date类型
    
    };
    
    struct Student student_1={20241514124,"黄飞宇",'M',"河南省固始县红苏路56号",2017,1,3};
//    或者这样赋值
//    student_1.birthday.year = 2017;
//    student_1.birthday.month = 1;
//    student_1.birthday.day = 3;
    
    printf("%s学生的信息:\n学号：%ld\n性别：%c\n地址：%s\n生日：\n年：%d\n月:%d\n日:%d\n",student_1.name,student_1.num,student_1.sex,student_1.addr,student_1.birthday.year,student_1.birthday.month,student_1.birthday.day);
    printf("sutdent_1地址为：%p",&student_1.num);
    
    struct Student student_2 = {.name="李白"};
    student_2.num = 10010;
    
    printf("\n\n%s学生的信息:\n学号：%ld\n性别：%c\n地址：%s\n:生日：\n年：%d\n月:%d\n日:%d",student_2.name,student_2.num,student_2.sex,student_2.addr,student_2.birthday.year,student_2.birthday.month,student_2.birthday.day);

}

void compareStudentScore()
{
    struct Student
    {
        long ID;
        char name[20];
        float score;
    }ChengXin,ChengYang;
    
    
    printf("请输入陈星的信息：\n");
    printf("输入ID：");
    scanf("%ld",&ChengXin.ID);
    printf("\n输入姓名：");
    scanf("%s",ChengXin.name);
    printf("\n输入分数：");
    scanf("%f",&ChengXin.score);
    
    
    printf("请输入陈洋的信息：\n");
    printf("输入ID：");
    scanf("%ld",&ChengYang.ID);
    printf("\n输入姓名：");
    scanf("%s",ChengYang.name);
    printf("\n输入分数：");
    scanf("%f",&ChengYang.score);
    
    printf("最高成绩者是：\n");
    if (ChengYang.score < ChengXin.score)
    {
        printf("\n%s的信息：\nID=%ld\nscore=%4.1f",ChengXin.name,ChengXin.ID,ChengXin.score);
    }else if(ChengYang.score > ChengXin.score)
        printf("\n%s的信息：\nID=%ld\nscore=%4.1f",ChengYang.name,ChengYang.ID,ChengYang.score);
    else
    {
            printf("\n%s的信息：\nID=%ld\nscore=%4.1f",ChengXin.name,ChengXin.ID,ChengXin.score);
            printf("\n%s的信息：\nID=%ld\nscore=%4.1f",ChengYang.name,ChengYang.ID,ChengYang.score);
    }


}


void dePiaoshu()
{
    struct President
    {
        char name[20];
        int  count;
    }person[3]={"jiang",0,"zhu",0,"xi",0};
    
    char monitor[20];
    for (int i = 0; i< 10; i++)
    {
        printf("请输入得票人的姓名：\n");
        scanf("%s",monitor+i);
        for (int j = 0; j<3; j++)
        {
            if (strcmp(monitor, person[j].name) == 0)
            {
                person[j].count ++;
            }
        }
    }
    
    for (int i = 0; i < 3 ; i++)
    {
        printf("%s得了%d票\n",person[i].name,person[i].count);
    }
}


void 指向结构体数组的指针()
{
    struct Student
    {
        int num;
        char name[20];
        char sex;
        int age;
    };
    
    struct Student student[3] ={{10101,"LiLin",'M',18},{10102,"ZhangFun",'M',19},{10104,"WangMin",'F',20}};
    
    struct Student *stu;//声明一个指针类型变量
    stu = student;//使元素的首地址指向指针变量stu
    
    
    for(int i = 0;i < 2;i++)
    {
        *stu = *(stu+i);
        printf("%s：\n学号：%d\n性别：%c\n年龄：%d\n\n",(*stu).name,(*stu).num,(*stu).sex,(*stu).age);
    
    }
    
    stu = student+2;
    printf("%s：\n学号：%d\n性别：%c\n年龄：%d\n",stu->name,stu->num,stu->sex,stu->age);//为了方便，c语言允许使用stu->num代表(*stu).name
    
}


struct Student
{
    int  num;
    char name[20];
    float score[3];
    float aver;
};

void outputTheHighestAverageScore()
{
    
    void input (struct Student student[]);
    struct Student max (struct Student student[]);
    void print (struct Student student);
    
    struct Student *stu;
    struct Student student[N];//定义3个元素
    stu = student;
    
    input(stu);
    print(max(stu));

}

void input (struct Student student[])
{
    student[0].num = 10101;
//    student[0].name[20] = {'C','h','e','n','g','Y','a','n','g'};
//    student[0].name[] = {"ChengYang"};
    int i =  1;
    struct Student *p;
    p = student;
    for (; p<student +N; p++)
    {
        printf("请输入第%d个学生的信息：\n",i);
        printf("学号：");
        scanf("%d",&(*p).num);
        printf("\n姓名:");
        scanf("%s",p->name);
        printf("\n3科分数：");
        scanf("%f%f%f",&p->score[0],&p->score[1],&p->score[2]);
        p->aver = ((*p).score[0]+(*p).score[1]+(*p).score[2])/3;
        i++;
        
    }
//    stu= {10101,"ChengYang",78,89,98};

}

struct Student max (struct Student student[])
{
    struct Student *temp;
    temp = student;
    for(int i = 1 ;i<N;i++)
    {
    if(temp->aver<student[i].aver)
        temp = student+i;
    }
    return *temp;

}

void print (struct Student student)
{
    printf("\n平局分最高的是：\n");
    printf("name=%s,\nnum= %d,\n3科成绩为：%5.2f %5.2f %5.2f\naver=%f",student.name,student.num,student.score[0],student.score[1],student.score[2],student.aver);
}

void buildList()
{
    struct studnet
    {
        int num;
        float score;
        struct studnet *next;
    };
    
    struct studnet student_1,student_2,student_3,*head,*p;//head是头指针
    head = &student_1;
    student_1.next = &student_2;
    student_2.next = &student_3;
    student_3.next = NULL;//等于null不指向任何存储单元
    
    student_1.num = 201726;
    student_1.score = 99;
    
    student_2.num = 201725;
    student_2.score = 100;
    
    student_3.num = 201724;
    student_3.score = 101;
    
    p = head;
    
    do {
        printf("\n num=%d, score=%5.1f\n",p->num,p->score);
        p= (*p).next;//或者p->next;
    } while (p != NULL);
    
}


struct student_one
{
    int num;
    float score;
    struct student *next;
};

void toEstablishTheDynamicLinkedList()
{
    struct student_one *creatLinkList();
    struct student_one *pt;
    
    pt = creatLinkList();
    printf("\nnum:%d\nscore:%5.1f\n",pt->num,pt->score);
}

struct student_one *creatLinkList()//指针类型函数，返回一个指针值，它指向一个struct studnet_one类型数据
{
    struct student_one *head,*p1,*p2 = NULL;
    int n = 0;
    p1 = p2 = (struct student_one *) malloc(LEN);//功能：分配LEN字节的存储区，返回所分配的内存区起始地址，如内存不够，返回为0；p1、p2都指向新开辟的节点；开辟一个长度为LEN的内存区
    head = NULL;
    printf("输入第一个链表节点值!\n");
    printf("num=");
    scanf("%d",&p1->num);
    printf("\nscore=");
    scanf("%f",&p1->score);
    
    while (p1->num !=0)
    {
        n +=1;
        if (n ==1)
            head = p1;//使head也指向p1指向的节点；
        else
            p2->next = p1;
        p2 = p1;
        p1 = (struct student_one *)malloc(LEN);
        
        printf("输入第%d个链表节点值!\n",n+1);
        printf("num=");
        scanf("%d",&p1->num);
        printf("score=");
        scanf("%f",&p1->score);
            
    }
    
    p2->next = NULL;
    
    return head;//返回一个起始地址
}

void enumType()
{
    enum Weekday
    {
        sun,
        mon,
        tue,
        wed=4,
        thu,
        fri,
        sat
    };
    
    enum
    {
        monther = 1,
        father = 2,
        son = 3,
        sister = 4
    }monther_1,father_1;
    
    enum Weekday workday,weekend;//Weekday:枚举类型，workday枚举变量
    workday = sun;
    weekend = fri;
    printf("~\(≧▽≦)/(枚举类型)Weekday的(枚举变量)：workday=%5d,  weekend= %5d",workday,weekend);
    
    monther_1 = monther;
    father_1 = father;
    
    printf("\n👪中monter：%5d,father:%5d",monther_1,father_1);
    
}

void tabllColor()
{
    enum Color//声明枚举类型
    {
        red,
        yellow,
        blue,
        white,
        black
    };
    
    enum Color i,j,k,pri;//声明枚举变量
    
    int n,loop;
    n = 0;
    
    for (i = red; i <= black; i++)
        for (j = red; j <= black; j ++)
            if (i != j)
                for (k = red; k <= black; k++)
                    if (k != i && k != j)
                    {
                        n +=1;//符合的次数加一；
                        printf("%-3d", n);
                        for (loop = 1; loop <= 3; loop++)
                        {
                            switch (loop)
                            {
                                    case 1:
                                    pri = i;
                                    break;
                                    case 2:
                                    pri = j;
                                    break;
                                    case 3:
                                    pri = k;
                                    break;
                                    default:
                                    break;
                            }
                            
                            switch (pri)
                            {
                                case red:
                                    printf("%-10s","red");
                                    break;
                                case yellow:
                                    printf("%-10s","yellow");
                                    break;
                                case blue:
                                    printf("%-10s","blue");
                                    break;
                                case white:
                                    printf("%-10s","white");
                                    break;
                                case black:
                                    printf("%-10s","black");
                                    break;
                                default:
                                    break;
                            }
                        }
                        printf("\n");
                    }
    printf("总共有%5d",n);
    
}






