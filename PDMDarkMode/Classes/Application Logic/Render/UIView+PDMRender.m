//
//  UIView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIView+PDMRender.h"
#import <objc/runtime.h>
#import "PDMColor.h"

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
        //backgroundColor High Priority
        UIColor *backgroundColor = self.backgroundColor;
        PDMColorItem *syncFoundItem = [skinItem colorItemWithOriginColor:backgroundColor];
        if (syncFoundItem != nil) {
            self.backgroundColor = syncFoundItem.replacingColor;
            [self setObject:backgroundColor forRestoreKey:@"backgroundColor"];
        }
        else {
            [skinItem colorItemWithOriginColor:backgroundColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    self.backgroundColor = foundItem.replacingColor;
                    [self setObject:backgroundColor forRestoreKey:@"backgroundColor"];
                }
            }];
        }
    }
    if ([self respondsToSelector:@selector(tintColor)]) {
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

- (BOOL)pdm_restore {
    if (self.pdm_skinItems == nil) {
        return NO;
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
    return YES;
}

#pragma mark - pdm_restoreData

- (PDMDictionary *)pdm_restoreData {
    return (PDMDictionary *)objc_getAssociatedObject(self, "pdm_restoreData");
}

- (void)setPdm_restoreData:(PDMDictionary *)pdm_restoreData {
    objc_setAssociatedObject(self, "pdm_restoreData", pdm_restoreData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setObject:(id)object forRestoreKey:(NSString *)restoreKey {
    if ([object isKindOfClass:[UIColor class]]) {
        object = [[PDMColor alloc] initWithColor:object];
    }
    if (object != nil && restoreKey != nil) {
        NSMutableDictionary *mutableDictionary = self.pdm_restoreData == nil ? [@{} mutableCopy] : [self.pdm_restoreData mutableCopy];
        [mutableDictionary setObject:object forKey:restoreKey];
        self.pdm_restoreData = [[PDMDictionary alloc] initWithDictionary:[mutableDictionary copy]];
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
