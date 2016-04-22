//
//  TYStatus.m
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYStatus.h"

@implementation TYStatus


-(TYStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.profileImageUrl=dic[@"profileImageUrl"];
        self.userName=dic[@"userName"];
        self.mbtype=dic[@"mbtype"];
        self.createdAt=dic[@"createdAt"];
        self.source=dic[@"source"];
        self.text=dic[@"text"];
    }
    return self;
}

+(TYStatus *)statusWithDictionary:(NSDictionary *)dic{
    TYStatus *status=[[TYStatus alloc]initWithDictionary:dic];
    return status;
}

-(NSString *)xingming{
    return [NSString stringWithFormat:@"来自 %@",_source];
}


@end
