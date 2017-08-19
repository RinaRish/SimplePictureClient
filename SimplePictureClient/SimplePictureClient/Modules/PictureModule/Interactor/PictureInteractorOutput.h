//
//  PictureInteractorOutput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

@class Picture;

/**
 *  Interactor output protocol
 */

@protocol PictureInteractorOutput <NSObject>

/**
 *  Method called if picture was successfully loaded
 */
- (void)didLoadPicture:(Picture *)picture;

/**
 *  Method called if error occured
 */
- (void)didFailToLoadPictureWithError:(NSError *)error;

@end

