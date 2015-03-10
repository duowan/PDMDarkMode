//
//  PDMCore.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMCore.h"

@interface PDMCore ()

@property (nonatomic, readwrite) PDMSkinManager *defaultManager;

@end

@implementation PDMCore

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.defaultManager = [[PDMSkinManager alloc] init];
    }
    return self;
}

@end
