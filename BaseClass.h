//
//  BaseClass.h
//  0418
//
//  Created by mac on 16/4/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseClass : NSObject
{
@public NSString *_name;
}


//
//@property(nonatomic, retain) UITextField *userName;    //1
//
//@property(nonatomic, retain,readwrite) UITextField *userName;  //2

//1,2等价

//@property(atomic, retain) UITextField *userName;  //3
//
//@property(retain) UITextField *userName;  //4

//3，4等价

//@property(atomic,assign) int i;         // 5
//
//@property(atomic) int i;         //6
//@property int i;               //7

//567等价    NSString用copy,delegate用assign
@property (nonatomic,copy,readonly)NSString *name;//readonly会声明get方法

//@property(nonatomic,copy,readwrite)NSString *name;
//readwrite会生成get，set方法

//@property(nonatomic,copy)NSString *name;
//readwrite atomic assign是默认行为


/*
 @dynamic关键字告诉编译器由我们自己来实现访问方法。如果使用的是@synthesize，那编译器会自己实现
 nonatomic对属性赋值的时候不加锁，多线程并发访问会提高性能
 atomic和nonatomic用来决定编译器生成的getter和setter是否为原子操作
 atomic，提供多线程安全 防止在写未完成的时候被另外一个线程读取，造成数据错误 会耗费系统资源
 assign: 简单赋值，不更改索引计数
 copy:建立一个索引计数为1的对象，然后释放旧对象
 retain:释放旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为1
 Copy其实是建立了一个相同的对象，而retain不是
 */

//@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)int number;
@property (nonatomic,copy)NSString *myString;

- (NSString *) name;

- (void)setName:(NSString *)newName;

@end
