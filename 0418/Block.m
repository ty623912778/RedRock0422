//
//  Block.m
//  0418
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)test
{
    if (_testBlock) {
        _testBlock();
    }
}


- (void)StartBlock{
    [self performSelector:@selector(test) withObject:nil afterDelay:2.0];
}
@end
