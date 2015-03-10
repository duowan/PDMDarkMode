//
//  PDMApplication.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMApplication.h"
#import "PDMCore.h"

@interface PDMApplication ()

@property (nonatomic, strong) PDMCore *core;

@end

@implementation PDMApplication

+ (PDMApplication *)sharedApplication {
    static PDMApplication *application;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        application = [[PDMApplication alloc] init];
    });
    return application;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.core = [[PDMCore alloc] init];
    }
    return self;
}

- (PDMSkinManager *)defaultManager {
    return self.core.defaultManager;
}

@end
