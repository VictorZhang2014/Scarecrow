//
//  OCTRepository+Persistence.h
//  Scarecrow
//
//  Created by duanhongjin on 16/8/29.
//  Copyright © 2016年 duanhongjin. All rights reserved.
//

#import <OctoKit/OctoKit.h>

typedef NS_ENUM(NSInteger, ADReposStarStatus) {
    ADReposStarStatusUnknown,
    ADReposStarStatusYes,
    ADReposStarStatusNo,
};

@interface OCTRepository (Persistence)

@property (assign, nonatomic) ADReposStarStatus starStatus;

+ (NSArray *)ad_matchStarredStatus:(NSArray *)reposArray;

+ (BOOL)ad_update:(NSArray *)reposArray;
+ (NSArray<__kindof OCTRepository*> *)ad_fetchRepos;

@end
