//
//  SerieTableViewCell.m
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import "SerieTableViewCell.h"

@implementation SerieTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.separatorInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, self.bounds.size.width);
    }
    return self;
}

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - efectos

- (void)setAlpha:(float)p
{

    CGFloat alpha = 1-(p<0.5?2*p:(1-p)*2);
//
    self.dark.alpha = alpha;
    self.title.alpha = alpha;
    
    
}

@end
