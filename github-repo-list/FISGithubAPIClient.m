//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"

@implementation FISGithubAPIClient

+(void)getAllReposWithCompletionHandler:(void (^)(NSArray *, NSError *))completionBlock
{
    NSURLSession *urlSession = [NSURLSession sharedSession];
    /* https://api.github.com/repositories?client_id=e0b7d8b7bf46020fa75d&client_secret=b31feeb68290e2d9feff179442382b7c4fcc5b0a */
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/repositories?client_id=e0b7d8b7bf46020fa75d&client_secret=b31feeb68290e2d9feff179442382b7c4fcc5b0a"];
    
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"NSURLSession complete");
        NSLog(@"error: %@", error);
        NSLog(@"response: %@", response);
        NSArray *arrayOfRepos = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        completionBlock(arrayOfRepos, nil);
    }];
    
    [task resume];
}

@end
