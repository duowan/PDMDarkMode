//
//  UILabel+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UILabel+PDMRender.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>

@implementation UILabel (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem] &&
        [self.pdm_previousAttributedString.string isEqualToString:self.attributedText.string]) {
        return NO;
    }
    NSAttributedString *attributedText = self.attributedText;
    self.pdm_previousAttributedString = self.attributedText;
    NSMutableAttributedString *mutableAttributedText = [attributedText mutableCopy];
    NSRange attributedTextRange = NSMakeRange(0, [attributedText length]);
    [attributedText enumerateAttribute:NSForegroundColorAttributeName inRange:attributedTextRange options:kNilOptions usingBlock:^(id value, NSRange range, BOOL *stop) {
        if (NSEqualRanges(range, attributedTextRange)) {
            UIColor *textColor = self.textColor;
            [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    self.textColor = foundItem.replacingColor;
                }
            }];
            [self setObject:textColor forRestoreKey:@"textColor"];
        }
        else {
            UIColor *textColor = value;
            [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    [mutableAttributedText addAttribute:NSForegroundColorAttributeName
                                                  value:foundItem.replacingColor
                                                  range:range];
                    if ([self.attributedText.string isEqualToString:mutableAttributedText.string]) {
                        self.attributedText = [mutableAttributedText copy];
                    }
                }
            }];
        }
    }];
    [self setObject:attributedText forRestoreKey:@"attributedText"];
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"textColor"] != nil) {
        self.textColor = self.pdm_restoreData[@"textColor"];
    }
    else {
        self.attributedText = self.pdm_restoreData[@"attributedText"];
    }
    [self.pdm_attributedTextSingal dispose];
}

#pragma mark - ReactiveCocoa

- (void)pdm_configureReactiveCocoa {
    [super pdm_configureReactiveCocoa];
    @weakify(self);
    self.pdm_attributedTextSingal =
    [RACObserve(self, attributedText) subscribeNext:^(id x) {
        @strongify(self);
        [self.pdm_skinItems enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            [self pdm_rendWithSkinItem:obj];
        }];
    }];
}

#pragma mark - pdm_previousAttributedString

- (void)setPdm_previousAttributedString:(NSAttributedString *)pdm_previousAttributedString {
    objc_setAssociatedObject(self, "pdm_previousAttributedString", pdm_previousAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSAttributedString *)pdm_previousAttributedString {
    return (NSAttributedString *)objc_getAssociatedObject(self, "pdm_previousAttributedString");
}

#pragma mark - pdm_attributedTextSingal

- (void)setPdm_attributedTextSingal:(RACDisposable *)pdm_attributedTextSingal {
    objc_setAssociatedObject(self, "pdm_attributedTextSingal", pdm_attributedTextSingal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RACDisposable *)pdm_attributedTextSingal {
    return objc_getAssociatedObject(self, "pdm_attributedTextSingal");
}

@end
