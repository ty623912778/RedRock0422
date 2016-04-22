//
//  TYViewController1.h
//  0418
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TYViewController1Delegate <NSObject>

- (void)sendValue:(NSString *)value;

@end

@interface TYViewController1 : UIViewController

@property (weak,nonatomic) id delegate;

@end
