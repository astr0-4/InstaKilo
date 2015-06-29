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
@property (nonatomic, strong) NSArray *sections;


@end

@implementation ViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    

    [super viewDidLoad];
 
    
    Photo *photo1 = [[Photo alloc] init];
    photo1.location = @"Masaai Mara";
    photo1.subject = @"Safari";
    photo1.fileName = @"GOPR0258.jpg";
    
    Photo *photo2 = [[Photo alloc] init];
    photo2.location = @"Nairobi";
    photo2.subject = @"Other";
    photo2.fileName = @"GOPR0208.jpg";
    
    Photo *photo3 = [[Photo alloc] init];
    photo3.location = @"Mombasa";
    photo3.subject = @"Beach";
    photo3.fileName = @"G0180743.jpg";
    
    Photo *photo4 = [[Photo alloc] init];
    photo4.location = @"Masaai Mara";
    photo4.subject = @"Safari";
    photo4.fileName = @"G0211200.jpg";
    
    Photo *photo5 = [[Photo alloc] init];
    photo5.location = @"Masaai Mara";
    photo5.subject = @"Safari";
    photo5.fileName = @"GOPR1208.jpg";
    
    Photo *photo6 = [[Photo alloc] init];
    photo6.location = @"Naivasha";
    photo6.subject = @"Other";
    photo6.fileName = @"GOPR1335.jpg";
    
    Photo *photo7 = [[Photo alloc] init];
    photo7.location = @"Mombasa";
    photo7.subject = @"Beach";
    photo7.fileName = @"GOPR0407.jpg";
    
    Photo *photo8 = [[Photo alloc] init];
    photo8.location = @"Mombasa";
    photo8.subject = @"Beach";
    photo8.fileName = @"GOPR0267.jpg";
    
    Photo *photo9 = [[Photo alloc] init];
    photo9.location = @"Naivasha";
    photo9.subject = @"Other";
    photo9.fileName = @"GOPR1297.jpg";
    
    Photo *photo10 = [[Photo alloc] init];
    photo10.location = @"Mombasa";
    photo10.subject = @"Beach";
    photo10.fileName = @"GOPR0298.jpg";
    
    self.photos = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSMutableSet *tempSet = [[NSMutableSet alloc] init];
    for(Photo *photo in self.photos) {
        [tempSet addObject:photo.subject];
        }
    NSLog(@"number of sections: %lu", (unsigned long)[tempSet count]);
    self.sections = [tempSet allObjects];
    NSLog(@"%@", self.sections);
    return [tempSet count];
   // return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // this method says how many sections we need
    NSString *sectionTitle = self.sections[section];
    int x = 0;
    for (Photo *photo in self.photos){
        if([photo.subject isEqualToString:sectionTitle]) {
            x++;
        }
    }
    return x;
    //section = 0;
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // this method makes the cells
    
    
    PhotoCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *sectionTitle = self.sections[indexPath.section];
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (Photo *photo in self.photos){
        if([photo.subject isEqualToString:sectionTitle]) {
            [tempArray addObject: photo.fileName];
       }
    }
    NSLog(@"temp array of photos is: %@", tempArray);
    photoCell.cellPhoto.image = [UIImage imageNamed:[tempArray objectAtIndex:indexPath.row]];
    
    return photoCell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
////this method sets the header
//{
//    if (kind == UICollectionElementKindSectionHeader) {
//        Header *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
//        NSMutableArray *tempArray;
//        for (Photo *photo in self.photos) {
//            [tempArray addObject:photo.subject];
//        }
//
//        headerView.headerLabel.text = self.sections[indexPath.section];
//        return headerView;
//    }
//    return nil;
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout *)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(300, 200);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout *)collectionViewLayout
//referenceSizeForHeaderInSection:(NSInteger)section
//{
//        return CGSizeMake(100, 100);
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // If you need to use the touched cell, you can retrieve it like so
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"touched cell %@ at indexPath %@", cell, indexPath);
}

@end
