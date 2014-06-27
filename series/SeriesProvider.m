//
//  SeriesProvider.m
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import "SeriesProvider.h"
#import "Serie.h"


@interface SeriesProvider()
@property (strong,nonatomic) RequestManager *requestManager;
@property (strong, nonatomic) dispatch_queue_t serial_dispatch_queue;
@end

@implementation SeriesProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestManager=[[RequestManager alloc] init];
        _serial_dispatch_queue = dispatch_queue_create("com.series.process.processdata", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)trendingSeriesWithSuccessBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock{
    
    NSString *path=@"trending.json/df2880909bafa2689135188bf47fe5f9";
    NSDictionary *parameters=@{};
    
    
    [self.requestManager GET:path parameters:parameters successBlock:^(id data) {
        
        dispatch_async(self.serial_dispatch_queue, ^{
            
            NSMutableArray *series=[NSMutableArray array];
            

                for (NSDictionary *showDictionary in data) {
                    
                    Serie *show=[[Serie alloc] init];
                    show.id=[showDictionary valueForKey:@"imdb_id"];
                    show.title=[showDictionary valueForKey:@"title"];
                    show.description=[showDictionary valueForKey:@"overview"];
                    
                    NSDictionary * imagesDict = [showDictionary valueForKey:@"images"];
                    
                    show.posterURL=[NSURL URLWithString:[imagesDict valueForKey:@"poster"]];
                    show.bannerURL=[NSURL URLWithString:[imagesDict valueForKey:@"banner"]];
                    
                    [series addObject:show];
                }

            
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(series);
            });
            
        });
        
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    }];
    
    
}
@end
