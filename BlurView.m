//
//  BlurView.m
//  Blur
//
//  Created by 葛佳佳 on 16/9/8.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "BlurView.h"

@implementation BlurView

- (instancetype)initWithFrame:(CGRect)frame blurStyle:(NSInteger)blurStyle backgroundColor:(UIColor *)backgroundColor
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = backgroundColor;
        [self blurWithStyle:blurStyle];
    }
    return self;
}

- (void)blurWithStyle:(NSUInteger)blurStyle
{
    if (blurStyle == BlurStyleUIBlurEffect) {
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0f) {
            
            UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            UIVisualEffectView *BlurView = [[UIVisualEffectView alloc] initWithEffect:blur];
            ((UIVisualEffectView *)BlurView).frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            BlurView.alpha = 0.7;
            [self addSubview:BlurView];
            [self sendSubviewToBack:BlurView];
            
        }else if([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0f){
            
            UIToolbar *BlurView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            ((UIToolbar *)BlurView).barStyle = UIBarStyleBlack;
            BlurView.alpha = 0.7;
            [self addSubview:BlurView];
            [self sendSubviewToBack:BlurView];
        }
    }else if (blurStyle == BlurStyleGPUImage) {
        GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
        GPUImageView *filterView = (GPUImageView *)self;
        [blurFilter addTarget:filterView];
    }
}

@end
