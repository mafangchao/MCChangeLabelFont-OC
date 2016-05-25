//
//  ViewController.m
//  MCChangeLabelFont-OC
//
//  Created by iOS on 16/5/25.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];
    label.text = @"你是从initWithFrame来的label";
    UILabel * label2 = [[UILabel alloc]init];
    label2.frame= CGRectMake(20, 200, 280, 30);
    label2.text = @"你是从init来的label";
    [self.view addSubview:label];
    [self.view addSubview:label2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
