//
//  ViewController.m
//  0418
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Block.h"
#import "TYTableViewController.h"
#import "BaseClass.h"

@interface ViewController ()

@property (nonatomic,retain)UIView *myView;
@end

@implementation ViewController
@synthesize myView;

- (IBAction)selectorCallBack:(id)sender {
    NSLog(@"selectorCallBack");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callback) name:@"test" object:nil];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"test" object:nil];
}

- (IBAction)notificationCallback:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"test" object:nil];
    
}
- (void)callback{
    NSLog(@"notification callback");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    Block *block = [[Block alloc] init];
    block.testBlock = ^()
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"My Alert" message:@"This is an alert" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
    };
    [block StartBlock];
    
    
    BaseClass *instance = [[BaseClass alloc] init];
    instance.number = 1;
    
    NSMutableString *string = [NSMutableString stringWithString:@"hello"];
    instance.myString = string;
    [string appendString:@"world"];
    NSLog(@"@%@",string);
    NSLog(@"%@",instance.myString);//myString在改变之前已经copy了一份副本
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
