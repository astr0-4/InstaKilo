//
//  PhotoData.h
//  InstaKilo
//
//  Created by Alex on 2015-06-25.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property(strong, nonatomic) NSString *location;
@property(strong, nonatomic) NSString *subject;
@property(strong, nonatomic) NSString *fileName;

@end
