//
//  Picture.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "Picture.h"

@implementation Picture

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        _image = image;
    }
    return self;
}

@end
