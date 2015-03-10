//
//  UIView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIView+PDMRender.h"

@implementation UIView (PDMRender)

- (void)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    {
        //backgroundColor
        UIColor *backgroundColor = self.backgroundColor;
        [skinItem colorItemWithOriginColor:backgroundColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.backgroundColor = foundItem.replacingColor;
            }
        }];
    }
}

@end
