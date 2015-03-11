//
//  UITextField+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UITextField+PDMRender.h"

@implementation UITextField (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    {
        UIColor *textColor = [self textColor];
        [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.textColor = foundItem.replacingColor;
                [self setObject:textColor forRestoreKey:@"textColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"textColor"] != nil) {
        self.textColor = self.pdm_restoreData[@"textColor"];
    }
}

@end
