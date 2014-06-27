//
//  SerieTableViewCell.h
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SerieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *dark;
@property (weak, nonatomic) IBOutlet UIImageView *banner;

- (void)setAlpha:(float)p;
@end
