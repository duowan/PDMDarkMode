//
//  UIView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIView+PDMRender.h"
#import <objc/runtime.h>

@implementation UIView (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if ([self.pdm_skinItems containsObject:skinItem]) {
        return NO;
    }
    else {
        if (self.pdm_skinItems == nil) {
            [self pdm_configureReactiveCocoa];//Configure ReactiveCocoa
        }
        NSMutableSet *skinItems = self.pdm_skinItems == nil ? [NSMutableSet set] : [self.pdm_skinItems mutableCopy];
        [skinItems addObject:skinItem];
        self.pdm_skinItems = skinItems;
    }
    {
        //backgroundColor
        UIColor *backgroundColor = self.backgroundColor;
        [skinItem colorItemWithOriginColor:backgroundColor withCompletionBlock:^(PDMColorItem *foundItem) {
            if (foundItem != nil) {
                self.backgroundColor = foundItem.replacingColor;
                [self setObject:backgroundColor forRestoreKey:@"backgroundColor"];
            }
        }];
    }
    {
        //tintColor
        if (self.tintColor != nil) {
            UIColor *tintColor = self.tintColor;
            [skinItem colorItemWithOriginColor:tintColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    self.tintColor = foundItem.replacingColor;
                    [self setObject:tintColor forRestoreKey:@"tintColor"];
                }
            }];
        }
    }
    return YES;
}

- (void)pdm_restore {
    if (self.pdm_skinItems == nil) {
        return;
    }
    else {
        self.pdm_skinItems = nil;
    }
    if (self.pdm_restoreData[@"backgroundColor"] != nil) {
        self.backgroundColor = self.pdm_restoreData[@"backgroundColor"];
    }
    if (self.pdm_restoreData[@"tintColor"] != nil) {
        self.tintColor = self.pdm_restoreData[@"tintColor"];
    }
    [self performSelector:@selector(setPdm_restoreData:) withObject:nil afterDelay:0.001];
}

#pragma mark - pdm_restoreData

- (NSDictionary *)pdm_restoreData {
    return (NSDictionary *)objc_getAssociatedObject(self, "pdm_restoreData");
}

- (void)setPdm_restoreData:(NSDictionary *)pdm_restoreData {
    objc_setAssociatedObject(self, "pdm_restoreData", pdm_restoreData, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setObject:(id)object forRestoreKey:(NSString *)restoreKey {
    if (object != nil && restoreKey != nil) {
        NSMutableDictionary *mutableDictionary = self.pdm_restoreData == nil ? [@{} mutableCopy] : [self.pdm_restoreData mutableCopy];
        [mutableDictionary setObject:object forKey:restoreKey];
        self.pdm_restoreData = mutableDictionary;
    }
}

#pragma mark - pdm_skinItems

- (NSSet *)pdm_skinItems {
    return (NSSet *)objc_getAssociatedObject(self, "pdm_skinItems");
}

- (void)setPdm_skinItems:(NSSet *)pdm_skinItems {
    objc_setAssociatedObject(self, "pdm_skinItems", pdm_skinItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - ReactiveCocoa

- (void)pdm_configureReactiveCocoa {
    
}

@end
