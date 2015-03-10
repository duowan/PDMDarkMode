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

@interface PDMRender ()

@end

@implementation PDMRender

- (void)rendWithSkinItem:(PDMSkinItem *)skinItem forView:(UIView *)view {
    {
        UIColor *backgroundColor = view.backgroundColor;
        if (backgroundColor != nil) {
            [skinItem colorItemWithOriginColor:backgroundColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    view.backgroundColor = foundItem.replacingColor;
                }
            }];
        }
    }
}

@end
