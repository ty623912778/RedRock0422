//
//  TYStatus.h
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYStatus : NSObject

@property (nonatomic,assign) long long Id;//微博id
@property (nonatomic,copy) NSString *profileImageUrl;//头像
@property (nonatomic,copy) NSString *userName;//发送用户
@property (nonatomic,copy) NSString *mbtype;//会员类型
@property (nonatomic,copy) NSString *createdAt;//创建时间
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *text;//微博内容

-(TYStatus *)initWithDictionary:(NSDictionary *)dic;
+(TYStatus *)statusWithDictionary:(NSDictionary *)dic;


@end
