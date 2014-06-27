//
//  Serie.h
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Serie : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy) NSString* id;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, copy) NSURL* posterURL;
@property (nonatomic, copy) NSURL* bannerURL;
@end
