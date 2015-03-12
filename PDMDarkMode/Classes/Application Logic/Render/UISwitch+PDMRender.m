//
//  UISwitch+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UISwitch+PDMRender.h"

@implementation UISwitch (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    {
        UIColor *onTintColor = self.onTintColor;
        [skinItem colorItemWithOriginColor:onTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.onTintColor = foundItem.replacingColor;
                [self setObject:onTintColor forRestoreKey:@"onTintColor"];
            }
        }];
    }
    {
        UIColor *thumbTintColor = self.thumbTintColor;
        [skinItem colorItemWithOriginColor:thumbTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.thumbTintColor = foundItem.replacingColor;
                [self setObject:thumbTintColor forRestoreKey:@"thumbTintColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"onTintColor"]) {
        self.thumbTintColor = self.pdm_restoreData[@"onTintColor"];
    }
    if (self.pdm_restoreData[@"thumbTintColor"]) {
        self.thumbTintColor = self.pdm_restoreData[@"thumbTintColor"];
    }
}

@end
