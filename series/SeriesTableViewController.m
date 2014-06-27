//
//  SeriesTableViewController.m
//  series
//
//  Created by Rafa Paradela on 27/06/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "SeriesTableViewController.h"
#import "SerieTableViewCell.h"
#import "SeriesProvider.h"
#import "Serie.h"



@interface SeriesTableViewController ()
@property (nonatomic, strong) NSMutableArray * series;
@property (strong,nonatomic) SeriesProvider *seriesProvider;
@end

@implementation SeriesTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _series = [NSMutableArray array];
        _seriesProvider=[[SeriesProvider alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.tableView.separatorColor = [UIColor blackColor];
}


- (void)viewWillAppear:(BOOL)animated{
    self.title = @"Series";
    [self loadSeries];
}


#pragma mark - Providers

- (void)loadSeries{
    
    [self.seriesProvider trendingSeriesWithSuccessBlock:^(id data) {
        self.series = data;
        [self.tableView reloadData];
        [self.tableView setContentOffset:CGPointMake(0.0, -63.0)];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error");
    }];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.series count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SerieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    Serie * s = [self.series objectAtIndex:indexPath.row];
    
    cell.title.text = s.title;
    
    
    UIImage * placeholder = [UIImage imageNamed:@"user.png"];
    
    [cell.banner setImageWithURL:s.bannerURL placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        
        if (image && cacheType == SDImageCacheTypeNone)
        {
            cell.banner.alpha = 0.0;
            [UIView animateWithDuration:1.0 animations:^{
                cell.banner.alpha = 1.0;
            }];
            
            cell.banner.frame = CGRectMake(0, 0, image.size.width/2.0, image.size.height/2.0);
        }
        
    }];
    
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (SerieTableViewCell* cell in self.tableView.visibleCells) {
        float distancia = cell.frame.origin.y-scrollView.contentOffset.y+64;
        float offset = distancia/scrollView.frame.size.height;
        [cell setAlpha:offset];
    }
}

@end
