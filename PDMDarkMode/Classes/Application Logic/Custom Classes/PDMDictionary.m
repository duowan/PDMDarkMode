//
//  PDMDictionary.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMDictionary.h"
#import "PDMColor.h"

@interface PDMDictionary ()

@property (nonatomic, copy) NSDictionary *myDictionary;

@end

@implementation PDMDictionary

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.myDictionary = @{};
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.myDictionary = dictionary;
    }
    return self;
}

- (NSUInteger)count {
    return [self.myDictionary count];
}

- (id)objectForKey:(id)aKey {
    id object = [self.myDictionary objectForKey:aKey];
    if ([object isKindOfClass:[PDMColor class]]) {
        object = [(PDMColor *)object color];
    }
    return object;
}

- (id)objectForKeyedSubscript:(id)key {
    id object = [self.myDictionary objectForKeyedSubscript:key];
    if ([object isKindOfClass:[PDMColor class]]) {
        object = [(PDMColor *)object color];
    }
    return object;
}

- (NSEnumerator *)keyEnumerator {
    return [self.myDictionary keyEnumerator];
}

- (id)mutableCopy {
    return [self.myDictionary mutableCopy];
}

@end
