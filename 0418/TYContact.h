//
//  TYContact.h
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYContact : NSObject
@property (nonatomic, copy)NSString *firstName;
@property (nonatomic, copy)NSString *lastName;
@property (nonatomic, copy)NSString *phoneNumber;

- (TYContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andphoneNumber:(NSString *)phoneNumber;

- (NSString *)getName;

+(TYContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;


@end
