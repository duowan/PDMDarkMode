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

- (void)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (self.pdm_isRended != nil) {
        return;
    }
    else {
        self.pdm_isRended = @YES;
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
}

- (void)pdm_restore {
    if (self.pdm_isRended == nil) {
        return;
    }
    else {
        self.pdm_isRended = nil;
    }
    self.backgroundColor = self.pdm_restoreData[@"backgroundColor"];
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

#pragma mark - pdm_isRended {

- (NSNumber *)pdm_isRended {
    return objc_getAssociatedObject(self, "pdm_isRended");
}

- (void)setPdm_isRended:(NSNumber *)pdm_isRended {
    objc_setAssociatedObject(self, "pdm_isRended", pdm_isRended, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
