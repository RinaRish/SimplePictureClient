//
//  PictureInteractor.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureInteractor.h"
#import "PictureServiceInput.h"
#import "ImageLoader.h"
#import "Picture.h"


@implementation PictureInteractor

#pragma mark - PictureInteractorInput

- (void)fetchNewPicture {
    [self.pictureService loadPicture];
}

#pragma mark - PictureServiceOutput

- (void)service:(id<PictureServiceInput>)service didLoadPicture:(Picture *)picture {
    [self.delegate didLoadPicture:picture];
}

- (void)service:(id<PictureServiceInput>)service didFailToLoadURLWithError:(NSError *)error {
    [self.delegate didFailToLoadPictureWithError:error];
}


@end
