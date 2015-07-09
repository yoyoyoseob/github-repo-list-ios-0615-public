//
//  FISReposDataStore.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISReposDataStore.h"

@implementation FISReposDataStore

+ (instancetype)sharedDataStore {
    static FISReposDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISReposDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories=[NSMutableArray new];
    }
    return self;
}

-(void)parseAllReposWithCompletion:(void (^)(NSArray*))block
{
    [FISGithubAPIClient getAllReposWithCompletionHandler:^(NSArray *repos, NSError *error) {
        [self.repositories removeAllObjects];
        for (NSDictionary *repo in repos)
        {
            [self.repositories addObject:[FISGithubRepository parseSingleDictionary:repo]];
        }
        block([self.repositories copy]);
    }];
}

//-(void)fetchRepositoriesWithCompletion:(void(^)(BOOL))block;
//{
//    [FISGithubAPIClient getAllReposWithCompletionHandler:^(NSArray *repoNames, NSError *error) {
//        [self.repositories removeAllObjects]; // Clear it just in case
//        for (NSDictionary *repoDict in repoNames)
//        {
//            FISGithubRepository *repo = [[FISGithubRepository alloc]initWithDictionary:repoDict];
//            [self.repositories addObject:repo];
//        }
//        
//        block(YES);
//    }];
//}


@end
