//
//  FISGithubRepository.h
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISGithubRepository : NSObject
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSURL *htmlURL;
@property (nonatomic, strong) NSString *repositoryID;

-(BOOL)isEqual:(FISGithubRepository *)repo1;
+(FISGithubRepository *)parseSingleDictionary:(NSDictionary *)repo;
//Create a new method in FISGithubRepository that will take the NSDictionary representation of the repository and returns a new instance of FISGithubRepository all filled out.


//-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
