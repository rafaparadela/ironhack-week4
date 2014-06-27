//
//  SeriesProvider.h
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManager.h"

@interface SeriesProvider : NSObject
- (void)trendingSeriesWithSuccessBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock;
@end
