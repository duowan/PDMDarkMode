//
//  UIProgressView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIProgressView+PDMRender.h"

@implementation UIProgressView (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    {
        UIColor *progressTintColor = self.progressTintColor;
        [skinItem colorItemWithOriginColor:progressTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.progressTintColor = foundItem.replacingColor;
                [self setObject:progressTintColor forRestoreKey:@"progressTintColor"];
            }
        }];
    }
    {
        UIColor *trackTintColor = self.trackTintColor;
        [skinItem colorItemWithOriginColor:trackTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.trackTintColor = foundItem.replacingColor;
                [self setObject:trackTintColor forRestoreKey:@"trackTintColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    if (![super pdm_restore]) {
        return;
    }
    if (self.pdm_restoreData[@"progressTintColor"] != nil) {
        self.progressTintColor = self.pdm_restoreData[@"progressTintColor"];
    }
    if (self.pdm_restoreData[@"trackTintColor"] != nil) {
        self.trackTintColor = self.pdm_restoreData[@"trackTintColor"];
    }
}

@end
