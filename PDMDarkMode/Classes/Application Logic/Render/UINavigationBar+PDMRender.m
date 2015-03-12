//
//  UINavigationBar+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UINavigationBar+PDMRender.h"

@implementation UINavigationBar (PDMRender)

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
                [self pdm_changeStatusBarStyle];
            }
        }];
    }
    {
        UIColor *titleColor = self.titleTextAttributes[NSForegroundColorAttributeName];
        [skinItem colorItemWithOriginColor:titleColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                [self setTitleTextAttributes:@{NSForegroundColorAttributeName: foundItem.replacingColor}];
                [self setObject:titleColor forRestoreKey:@"barTitleColor"];
            }
        }];
    }
    return YES;
}

- (void)pdm_changeStatusBarStyle {
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7) {
        if ([[UIApplication sharedApplication] statusBarStyle] == UIStatusBarStyleDefault) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        }
        else {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        }
    }
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"barTintColor"] != nil) {
        self.barTintColor = self.pdm_restoreData[@"barTintColor"];
        [self pdm_changeStatusBarStyle];
    }
    if (self.pdm_restoreData[@"barTitleColor"] != nil) {
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName: self.pdm_restoreData[@"barTitleColor"]}];
    }
}

@end
