//
//  TYContactGroup.m
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYContactGroup.h"

@implementation TYContactGroup

- (TYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts
{
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+ (TYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts
{
    TYContactGroup *group1 = [[TYContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return group1;
}
@end
