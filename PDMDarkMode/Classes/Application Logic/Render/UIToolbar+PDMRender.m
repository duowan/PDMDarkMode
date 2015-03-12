//
//  UIToolbar+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIToolbar+PDMRender.h"

@implementation UIToolbar (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    if ([self respondsToSelector:@selector(barTintColor)]) {
        UIColor *barTintColor = self.barTintColor;
        [skinItem colorItemWithOriginColor:barTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.barTintColor = foundItem.replacingColor;
                [self setObject:barTintColor forRestoreKey:@"barTintColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"barTintColor"] != nil) {
        self.barTintColor = self.pdm_restoreData[@"barTintColor"];
    }
}

@end
