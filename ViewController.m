//
//  ViewController.m
//  Blur
//
//  Created by 葛佳佳 on 16/9/8.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "ViewController.h"
#import "BlurView.h"

@interface ViewController ()

@property (nonatomic, strong) BlurView *blurView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)BlurClick:(UIBarButtonItem *)sender {
    UIAlertController *blurAlert = [UIAlertController alertControllerWithTitle:@"Blur" message:@"Choose Blur" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"CancelBlur" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *clearAction = [UIAlertAction actionWithTitle:@"ClearBlur" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (_blurView) {
            [_blurView removeFromSuperview];
        }
    }];
    UIAlertAction *blurEffectAction = [UIAlertAction actionWithTitle:@"UIBlurEffect" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (_blurView) {
            [_blurView removeFromSuperview];
        }
        _blurView = [[BlurView alloc]initWithFrame:self.view.bounds blurStyle:BlurStyleUIBlurEffect backgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
        [self.view addSubview:_blurView];
    }];
    UIAlertAction *blurGPUImageAction = [UIAlertAction actionWithTitle:@"GPUImageBlur" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (_blurView) {
            [_blurView removeFromSuperview];
        }
        _blurView = [[BlurView alloc]initWithFrame:self.view.bounds blurStyle:BlurStyleGPUImage backgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]];
        [self.view addSubview:_blurView];
    }];

    [blurAlert addAction:cancelAction];
    [blurAlert addAction:blurEffectAction];
    [blurAlert addAction:blurGPUImageAction];
    [blurAlert addAction:clearAction];
    
    [self presentViewController:blurAlert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
