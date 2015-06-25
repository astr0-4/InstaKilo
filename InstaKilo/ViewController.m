//
//  ViewController.m
//  InstaKilo
//
//  Created by Alex on 2015-06-25.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *sectionTitles;


@end

@implementation ViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.photos = @[[UIImage imageNamed:@"GOPR0258.jpg"], [UIImage imageNamed:@"GOPR0208.jpg"], [UIImage imageNamed:@"G0180743.jpg"], [UIImage imageNamed:@"G0211200.jpg"], [UIImage imageNamed:@"GOPR1208.jpg"], [UIImage imageNamed:@"GOPR1335.jpg"], [UIImage imageNamed:@"GOPR0407.jpg"], [UIImage imageNamed:@"GOPR0267.jpg"], [UIImage imageNamed:@"GOPR1297.jpg"], [UIImage imageNamed:@"GOPR0298.jpg"]];
    
    self.sectionTitles = @[@"safari", @"mombasa"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.sectionTitles count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    photoCell.cellPhoto.image = self.photos[indexPath.row];
    return photoCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        Header *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        NSString *title = self.sectionTitles[indexPath.row];
        headerView.headerLabel.text = title;
        
        return headerView;
    }
    return nil;
    
}


@end
