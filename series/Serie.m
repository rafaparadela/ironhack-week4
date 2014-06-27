//
//  Serie.m
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import "Serie.h"

@implementation Serie

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"imdb_id",
             @"title": @"title",
             @"description": @"overview",
             @"posterURL": @"poster",
             @"bannerURL": @"banner"
             };
}

@end
