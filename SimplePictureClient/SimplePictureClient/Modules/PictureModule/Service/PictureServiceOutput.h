//
//  PictureServiceOutput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureServiceInput.h"
#import "PictureServiceOutput.h"

@class Picture;

/**
 *  Output protocol for Picture Service
 */
@protocol PictureServiceOutput <NSObject>

/**
 *  Method for succesuful image loading
 */
- (void)service:(id <PictureServiceInput>)service didLoadPicture:(Picture *)picture;

/**
 *  Method called if error occured
 */
- (void)service:(id <PictureServiceInput>)service didFailToLoadURLWithError:(NSError *)error;

@end


