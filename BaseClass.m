//
//  BaseClass.m
//  0418
//
//  Created by mac on 16/4/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "BaseClass.h"

@implementation BaseClass

//@synthesize name = _name;
//同时生成get set方法 若定义了set方法则只生成get 。若自己写了get set则这句话没用了

//如果用@synthesize去让编译器生成代码，那么atomic和nonatomic生成的代码是不一样的。如果使用atomic，它会保证每次getter和setter的操作都会正确的执行完毕，而不用担心其它线程在get的时候set，可以说保证了某种程度上的线程安全。但是，不能仅仅靠atomic来保证线程安全。要写出线程安全的代码，还需要有同步和互斥机制。


@synthesize number;
@synthesize myString;

- (void)setName:(NSString *)name{
    if (_name != name) {
        _name = [name copy];
        //property(retain)NSString *name;
     //   _name = [name retain];
        //property(assign)NSString *name;
     //   _name = name;
    }
}

@end
