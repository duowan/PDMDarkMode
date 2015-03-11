//
//  UIPageControl+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIPageControl+PDMRender.h"

@implementation UIPageControl (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    {
        UIColor *pageIndicatorTintColor = self.pageIndicatorTintColor;
        [skinItem colorItemWithOriginColor:pageIndicatorTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.pageIndicatorTintColor = foundItem.replacingColor;
                [self setObject:pageIndicatorTintColor forRestoreKey:@"pageIndicatorTintColor"];
            }
        }];
    }
    {
        UIColor *currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
        [skinItem colorItemWithOriginColor:currentPageIndicatorTintColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.currentPageIndicatorTintColor = foundItem.replacingColor;
                [self setObject:currentPageIndicatorTintColor forRestoreKey:@"currentPageIndicatorTintColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"pageIndicatorTintColor"]) {
        self.currentPageIndicatorTintColor = self.pdm_restoreData[@"pageIndicatorTintColor"];
    }
    if (self.pdm_restoreData[@"currentPageIndicatorTintColor"]) {
        self.currentPageIndicatorTintColor = self.pdm_restoreData[@"currentPageIndicatorTintColor"];
    }
}

@end
