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
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - efectos

- (void)setOffset:(float)p
{
    CGRect imageFrame = self.banner.frame;
    imageFrame.origin = CGPointMake(0, -p*(self.banner.frame.size.height-self.bounds.size.height));
    self.banner.frame = imageFrame;
}

@end
