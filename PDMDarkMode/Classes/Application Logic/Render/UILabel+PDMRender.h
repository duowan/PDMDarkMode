//
//  UILabel+PDMRender.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+PDMRender.h"

@class RACDisposable;

@interface UILabel (PDMRender)

@property (nonatomic, strong) NSAttributedString *pdm_previousAttributedString;

@property (nonatomic, strong) RACDisposable *pdm_attributedTextSingal;

@end
