//
//  UIButton+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/11.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIButton+PDMRender.h"

static NSArray *stateArray;

@implementation UIButton (PDMRender)

+ (void)load {
    stateArray = @[@(UIControlStateNormal),
                   @(UIControlStateHighlighted),
                   @(UIControlStateDisabled),
                   @(UIControlStateSelected)];
}

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    if (self.buttonType == UIButtonTypeCustom) {
        [stateArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIColor *stateColor = [self titleColorForState:[obj unsignedIntegerValue]];
            [skinItem colorItemWithOriginColor:stateColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    [self setTitleColor:foundItem.replacingColor forState:[obj unsignedIntegerValue]];
                    [self setObject:stateColor
                      forRestoreKey:[NSString stringWithFormat:@"buttonTitleColorForState%@", obj]];
                }
            }];
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.buttonType == UIButtonTypeCustom) {
        [stateArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIColor *stateColor = self.pdm_restoreData[[NSString stringWithFormat:@"buttonTitleColorForState%@", obj]];
            if (stateColor != nil) {
                [self setTitleColor:stateColor forState:[obj unsignedIntegerValue]];
            }
        }];
    }
}

@end
