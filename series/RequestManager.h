//
//  RequestManager.h
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestManagerSuccess)(id data);
typedef void (^RequestManagerError)(NSError *error);

@interface RequestManager : NSObject

@property (copy,nonatomic) NSString *baseDomain;
- (instancetype)initWithBaseURL: (NSString*) baseURL;
- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock;
@end