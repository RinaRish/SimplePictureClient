//
//  PictureInteractorInput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

/**
 *  Interactor input protocol
 */

@protocol PictureInteractorInput <NSObject>

/**
 *  Method responsible for fetching new image
 */
- (void)fetchNewPicture;

@end

