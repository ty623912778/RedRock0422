//
//  TYViewController.m
//  0418
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYViewController.h"
#import "ProtocolDelegate.h"
#import "TYViewController1.h"

@interface TYViewController ()

@end

@implementation TYViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TYViewController1 *vc = segue.destinationViewController;
    vc.delegate = self;
}

- (void)sendValue:(NSString *)value
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"成功" message:value preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:defaultAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"成功" message:value delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alertView show];
}

- (void)error
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
