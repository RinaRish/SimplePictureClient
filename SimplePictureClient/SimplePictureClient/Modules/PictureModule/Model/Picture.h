//
//  Picture.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Image model object
 */

@interface Picture : NSObject

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image;

@end
