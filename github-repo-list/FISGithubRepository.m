//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

-(BOOL)isEqual:(id)object
{
    if (object == nil)
    {
       return NO;
    }
    if (![object isKindOfClass:[FISGithubRepository class]])
    {
        return NO;
    }
    FISGithubRepository *otherRepo = object;
    return [self.repositoryID isEqual:otherRepo.repositoryID];
}

//-(instancetype)initWithDictionary:(NSDictionary *)dictionary
//{
//    self = [super init];
//    if (self)
//    {
//        _fullName = dictionary[@"full_name"];
//        
//        NSString *idString = dictionary[@"id"];
//        _repositoryID = idString;
//        
//        NSString *urlString = dictionary[@"html_url"];
//        _htmlURL = [NSURL URLWithString:urlString];
//    }
//    return self;
//}

+(FISGithubRepository *)parseSingleDictionary:(NSDictionary *)repo
{
    FISGithubRepository *dictionaryToParse = [[FISGithubRepository alloc]init];
    
    dictionaryToParse.fullName = repo[@"full_name"];
    
    NSString *idString = [repo[@"id"]stringValue];
    dictionaryToParse.repositoryID = idString;
    
    NSString *urlString = repo[@"html_url"];
    dictionaryToParse.htmlURL = [NSURL URLWithString:urlString];
    
    return dictionaryToParse;
}

-(NSString*) description
{
    return self.fullName;
}

  //Shell of a method that will work with ONE NSDictionary and return instance of FISGithubRepository

@end
