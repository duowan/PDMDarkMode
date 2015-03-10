//
//  PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMRender.h"
#import "PDMSkinManager.h"
#import "PDMColorItem.h"
#import "UIView+PDMRender.h"

@interface PDMRender ()

@end

@implementation PDMRender

- (void)rendWithSkinItem:(PDMSkinItem *)skinItem forView:(UIView *)view {
    [view pdm_rendWithSkinItem:skinItem];
}

@end
