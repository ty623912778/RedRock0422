//
//  Block.h
//  0418
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject
typedef void (^TestBlock)();
@property (nonatomic, strong) TestBlock testBlock;

- (void)StartBlock;


@end
