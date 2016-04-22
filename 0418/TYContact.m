//
//  TYContact.m
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYContact.h"

@implementation TYContact

- (TYContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andphoneNumber:(NSString *)phoneNumber
{
    if (self = [super init]) {
        self.firstName = firstName;

        self.lastName = lastName;

        self.phoneNumber = phoneNumber;

    }
    return self;
}

- (NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

+(TYContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber
{
    TYContact *contact1 = [[TYContact alloc]initWithFirstName:firstName andLastName:lastName andphoneNumber:phoneNumber];
    return contact1;
}
@end
