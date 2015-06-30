//
//  CoverFlowLayout.m
//  InstaKilo
//
//  Created by Alex on 2015-06-26.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "CoverFlowLayout.h"

@import QuartzCore;

@interface CoverFlowLayout()
@property (nonatomic, strong) NSMutableArray *cellAttributes;
@property (nonatomic, strong) PhotoCell *cell;


@end

@implementation CoverFlowLayout


-(void)prepareLayout
{
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 10;
    self.itemSize = CGSizeMake(300, 200);
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        if(CGRectIntersectsRect(attr.frame, visibleRegion)) {
            CGFloat distanceFromCenter = fabs(CGRectGetMidX(visibleRegion) - attr.center.x);
            CGFloat normalizedDistance = (distanceFromCenter/(visibleRegion.size.width/2))*M_PI;
            CATransform3D transform = CATransform3DRotate(attr.transform3D, M_PI, 1.0, 0, 0);
            transform= CATransform3DScale(attr.transform3D, 1 + cosf(normalizedDistance)/2, 1 + cosf(normalizedDistance)/2,0);
            attr.transform3D = transform;
        }
    }
    return attributes;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
