//
//  UIActivityIndicatorView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIActivityIndicatorView+PDMRender.h"

@implementation UIActivityIndicatorView (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    if (self.color != nil) {
        UIColor *color = self.color;
        [skinItem colorItemWithOriginColor:color withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.color = foundItem.replacingColor;
                [self setObject:color forRestoreKey:@"color"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    if (![super pdm_restore]) {
        return;
    }
    if (self.pdm_restoreData[@"color"] != nil) {
        self.color = self.pdm_restoreData[@"color"];
    }
}

@end
