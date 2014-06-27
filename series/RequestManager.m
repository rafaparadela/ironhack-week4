//
//  RequestManager.m
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import "RequestManager.h"
#import "AFHTTPRequestOperationManager.h"

@implementation RequestManager
- (instancetype)init
{
    return [self initWithBaseURL:@"http://api.trakt.tv/shows/"];
}

- (instancetype)initWithBaseURL: (NSString*) baseURL
{
    self = [super init];
    if (self) {
        _baseDomain=baseURL;
    }
    return self;
}

- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self.baseDomain stringByAppendingPathComponent:path] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

@end
