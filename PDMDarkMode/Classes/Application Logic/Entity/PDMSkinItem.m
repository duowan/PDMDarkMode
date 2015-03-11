//
//  PDMSkinItem.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMSkinItem.h"
#import "PDMColorItem.h"

@interface PDMSkinItem ()

@property (nonatomic, copy) NSDictionary *colorItemsDictionary;

@end

@implementation PDMSkinItem

- (void)loadStyleSheetFromPlist:(NSString *)filePath {
    self.styleSheet = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSAssert(self.styleSheet != nil, @"样式表加载失败");
}

- (void)setStyleSheet:(NSDictionary *)styleSheet {
    _styleSheet = styleSheet;
    [self findColorItems];
}

- (void)findColorItems {
    NSMutableArray *items = [NSMutableArray array];
    NSMutableDictionary *itemsDictionary = [NSMutableDictionary dictionary];
    [self.styleSheet enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        PDMColorItem *item = [[PDMColorItem alloc] initWithOriginalColorString:key replacingColorString:obj];
        [items addObject:item];
        [itemsDictionary setObject:item forKey:@(item.originalColorHash)];
    }];
    NSArray *sortedItems =
    [items sortedArrayUsingComparator:^NSComparisonResult(PDMColorItem *obj1, PDMColorItem *obj2) {
        if (obj1.originalColorHash == obj2.originalColorHash) {
            return NSOrderedSame;
        }
        else {
            return obj1.originalColorHash > obj2.originalColorHash ? NSOrderedAscending : NSOrderedDescending;
        }
    }];
    self.colorItems = [NSOrderedSet orderedSetWithArray:sortedItems];
    self.colorItemsDictionary = itemsDictionary;
}

- (void)colorItemWithOriginColor:(UIColor *)originColor withCompletionBlock:(void (^)(PDMColorItem *))completionBlock {
    if (originColor == nil || completionBlock == nil) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSUInteger originColorHash = [PDMColorItem colorHash:originColor];
        if (self.colorItemsDictionary[@(originColorHash)] != nil) {
            //精确查找
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(self.colorItemsDictionary[@(originColorHash)]);
            });
        }
        else {
            //二分范围查找
            PDMColorItem *searchingItem = [[PDMColorItem alloc] init];
            searchingItem.originalColor = originColor;
            searchingItem.originalColorHash = [PDMColorItem colorHash:originColor];
            NSUInteger colorItemIndex =
            [self.colorItems.array
             indexOfObject:searchingItem
             inSortedRange:NSMakeRange(0, self.colorItems.count)
             options:NSBinarySearchingFirstEqual
             usingComparator:^NSComparisonResult(PDMColorItem *obj1, PDMColorItem *obj2) {
                 NSUInteger currentOffset = (NSUInteger)labs(obj1.originalColorHash - obj2.originalColorHash);
                 CGFloat availabelOffset = MAX(obj1.availabelOffset, obj2.availabelOffset);
                 if (availabelOffset > 0.001 &&
                     currentOffset / pow(kPDMColorDegreeOfAccuracy, 4) <= availabelOffset &&
                     (currentOffset / pow(kPDMColorDegreeOfAccuracy, 3) - (NSInteger)(currentOffset / pow(kPDMColorDegreeOfAccuracy, 3))) <= availabelOffset &&
                     (currentOffset / pow(kPDMColorDegreeOfAccuracy, 2) - (NSInteger)(currentOffset / pow(kPDMColorDegreeOfAccuracy, 2))) <= availabelOffset &&
                     (currentOffset / pow(kPDMColorDegreeOfAccuracy, 1) - (NSInteger)(currentOffset / pow(kPDMColorDegreeOfAccuracy, 1))) <= availabelOffset) {
                     return NSOrderedSame;
                 }
                 else if (obj1.originalColorHash == obj2.originalColorHash){
                     return NSOrderedSame;
                 }
                 else {
                     return obj1.originalColorHash > obj2.originalColorHash ? NSOrderedAscending : NSOrderedDescending;
                 }
            }];
            if (colorItemIndex == NSNotFound || colorItemIndex >= [self.colorItems.array count]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(nil);
                });
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(self.colorItems.array[colorItemIndex]);
                });
            }
        }
    });
}

@end
