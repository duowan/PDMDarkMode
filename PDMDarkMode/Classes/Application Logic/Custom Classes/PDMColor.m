//
//  PDMColor.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMColor.h"

@interface PDMColor () {
    CGFloat r,g,b,a;
}

@end

@implementation PDMColor

- (instancetype)initWithColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        r = 0.0;g = 0.0;b = 0.0;a = 1.0;
        [color getRed:&r green:&g blue:&b alpha:&a];
    }
    return self;
}

- (UIColor *)color {
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
