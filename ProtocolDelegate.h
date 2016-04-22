//
//  ProtocolDelegate.h
//  0418
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolDelegate <NSObject>
@required

- (void)error;

@optional

- (void)other;

- (void)other2;

- (void)other3;

@end
