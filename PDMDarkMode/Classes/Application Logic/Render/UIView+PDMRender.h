//
//  UIView+PDMRender.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDMSkinItem.h"
#import "PDMColorItem.h"

@interface UIView (PDMRender)

- (void)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem;

@end
