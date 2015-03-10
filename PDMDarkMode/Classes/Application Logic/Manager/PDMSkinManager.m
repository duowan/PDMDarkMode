//
//  PDMSkinManager.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMSkinManager.h"
#import "PDMRender.h"

@interface PDMSkinManager ()

@property (nonatomic, copy) NSSet *items;

@property (nonatomic, strong) PDMRender *render;

@end

@implementation PDMSkinManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.render = [[PDMRender alloc] init];
    }
    return self;
}

- (void)addItem:(PDMSkinItem *)item {
    NSMutableSet *items = self.items == nil ? [NSMutableSet set] : [self.items mutableCopy];
    [items addObject:item];
    self.items = items;
}

- (void)applyWithViewController:(UIViewController *)viewController {
    [self.items enumerateObjectsWithOptions:kNilOptions usingBlock:^(PDMSkinItem *obj, BOOL *stop) {
        if (obj.applyClasses == nil && obj.avoidClasses == nil) {
            [self applySkinItem:obj view:viewController.view isRecursive:YES];
        }
        else if (obj.applyClasses != nil) {
            if ([obj.applyClasses containsObject:NSStringFromClass([viewController class])]) {
                [self applySkinItem:obj view:viewController.view isRecursive:YES];
            }
        }
        else if (obj.avoidClasses != nil) {
            if (![obj.avoidClasses containsObject:NSStringFromClass([viewController class])]) {
                [self applySkinItem:obj view:viewController.view isRecursive:YES];
            }
        }
    }];
}

- (void)applyWithView:(UIView *)view isRecursive:(BOOL)isRecursive {
    [self.items enumerateObjectsWithOptions:kNilOptions usingBlock:^(PDMSkinItem *obj, BOOL *stop) {
        [self applySkinItem:obj view:view isRecursive:isRecursive];
    }];
}

- (void)applySkinItem:(PDMSkinItem *)SkinItem view:(UIView *)view isRecursive:(BOOL)isRecursive {
    BOOL isValid = NO;
    if (SkinItem.applyClasses == nil && SkinItem.avoidClasses == nil) {
        isValid = YES;
    }
    else if (SkinItem.applyClasses != nil) {
        if ([SkinItem.applyClasses containsObject:NSStringFromClass([view class])]) {
            isValid = YES;
        }
    }
    else if (SkinItem.avoidClasses != nil) {
        if (![SkinItem.avoidClasses containsObject:NSStringFromClass([view class])]) {
            isValid = YES;
        }
    }
    if (isValid) {
        [self.render rendWithSkinItem:SkinItem forView:view];
        if (isRecursive) {
            [[view subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [self applySkinItem:SkinItem view:obj isRecursive:isRecursive];
            }];
        }
    }
}

- (void)restoreWithViewController:(UIViewController *)viewController {
    [self restoreWithView:viewController.view isRecursive:YES];
}

- (void)restoreWithView:(UIView *)view isRecursive:(BOOL)isRecursive {
    [self.render restoreWithView:view];
    if (isRecursive) {
        [[view subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self restoreWithView:obj isRecursive:isRecursive];
        }];
    }
}

@end
