//
//  TYContactGroup.h
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYContact.h"

@interface TYContactGroup : NSObject

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *detail;

@property (nonatomic,strong)NSMutableArray *contacts;

- (TYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

+ (TYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;


@end
