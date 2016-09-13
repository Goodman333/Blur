//
//  BlurView.h
//  Blur
//
//  Created by 葛佳佳 on 16/9/8.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

typedef NS_ENUM(NSInteger, BlurStyle) {
    BlurStyleUIBlurEffect,
    BlurStyleGPUImage,
};

@interface BlurView : GPUImageView

- (instancetype)initWithFrame:(CGRect)frame blurStyle:(NSInteger)blurStyle backgroundColor:(UIColor *)backgroundColor;

@end
