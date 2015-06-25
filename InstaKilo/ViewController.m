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
@property (nonatomic, strong) NSArray *numberOfSections;


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
    NSLog(@"number of sections: %lu", [tempSet count]);
    return [tempSet count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    int x = 0;
    int y = 0;
    int z = 0;
    for (Photo *photo in self.photos){
        if([photo.subject isEqualToString: @"Beach"]) {
            x++;
        }
        else if ([photo.subject isEqualToString:@"Safari"]) {
            y++;
        }
        else {
            z++;
        }
    }
    if(section == 0) {
        NSLog(@"x is %d", x);
        return x;
    }
    else if (section == 1) {
        NSLog(@"y is %d", y);
        return y;
    }
    else if(section == 2) {
        NSLog(@"z is %d", z);
        return z;
    }
    
    return 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    for(Photo *photo in self.photos) {
        photoCell.cellPhoto.image = [UIImage imageNamed:photo.fileName];
    }

    return photoCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        Header *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        NSMutableArray *tempArray;
        for (Photo *photo in self.photos) {
            [tempArray addObject: photo.location];
        }
        
        NSString *title = tempArray[indexPath.section];
       headerView.headerLabel.text = title;
        
        return headerView;
    }
    
    return nil;
}






@end
