//
//  PDMSkinManager.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMSkinManager.h"

@interface PDMSkinManager ()

@property (nonatomic, copy) NSSet *items;

@end

@implementation PDMSkinManager

- (void)addItem:(PDMSkinItem *)item {
    NSMutableSet *items = self.items == nil ? [NSMutableSet set] : [self.items mutableCopy];
    [items addObject:item];
    self.items = items;
}

@end
