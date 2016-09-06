//
//  ADReposItemViewModel.m
//  Scarecrow
//
//  Created by duanhongjin on 16/9/7.
//  Copyright © 2016年 duanhongjin. All rights reserved.
//

#import "ADReposItemViewModel.h"
#import <FormatterKit/TTTTimeIntervalFormatter.h>

@interface ADReposItemViewModel ()

@property (strong, nonatomic) OCTRepository *repos;

@property (copy, nonatomic) NSAttributedString *name;
@property (copy, nonatomic) NSAttributedString *reposDescription;
@property (copy, nonatomic) NSString *udpateTime;
@property (copy, nonatomic) NSString *language;

@property (assign, nonatomic) CGFloat height;

@end

@implementation ADReposItemViewModel

- (instancetype)initWithRepos:(OCTRepository *)repos {
    self = [super init];
    if (self) {
        self.repos = repos;
                
        self.language = repos.language ?: @"";
        CGFloat height = 0;
        if (repos.repoDescription.length) {
            self.reposDescription = [[NSAttributedString alloc]initWithString:repos.repoDescription];
            
            NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
            CGFloat width = LAYOUT_DEFAULT_WIDTH - 15 - 22 - 10 - 15;
            CGRect rect = [repos.repoDescription boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            height = MIN(rect.size.height, 18 * 3);
        }
        self.height = 10 + 21 + 5 + height + 5 + 15 + 8 + 1;
        
        TTTTimeIntervalFormatter *formatter = [TTTTimeIntervalFormatter new];
        formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        self.udpateTime = [formatter stringForTimeIntervalFromDate:[NSDate date] toDate:repos.dateUpdated];
    }
    return self;
}

- (NSAttributedString *)name {
    if (!_name) {
        _name = [[NSAttributedString alloc]initWithString:self.repos.name];
    }
    return _name;
}

@end
