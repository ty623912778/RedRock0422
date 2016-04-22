//
//  TYViewController1.m
//  0418
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYViewController1.h"
#import "TYViewController.h"

@interface TYViewController1 ()
@property (strong, nonatomic)IBOutlet UITextField *textField;

@end

@implementation TYViewController1

- (IBAction)backAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(sendValue:)]) {
        [_delegate sendValue:_textField.text];
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popViewControllerAnimated: YES];
    }];
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
