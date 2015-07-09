//
//  FISGithubAPIClient.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISGithubAPIClient : NSObject

// Method that retrieves a list of ALL repos and passes NSARRAY of NSDICTIONARIES to completionBlock [NSURLSession]

+(void)getAllReposWithCompletionHandler:(void (^)(NSArray *, NSError *))completionBlock;

@end
