//
//  UILabel+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UILabel+PDMRender.h"

@implementation UILabel (PDMRender)

- (void)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    [super pdm_rendWithSkinItem:skinItem];
    {
        //textColor
        UIColor *textColor = self.textColor;
        [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.textColor = foundItem.replacingColor;
            }
        }];
    }
}

@end
