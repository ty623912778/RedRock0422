//
//  TYStatusTableViewCell.h
//  0418
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYStatus;
@interface TYStatusTableViewCell : UITableViewCell
@property (nonatomic,strong) TYStatus *status;
@property (assign,nonatomic) CGFloat height;



@end
