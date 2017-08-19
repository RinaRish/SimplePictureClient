//
//  PictureServiceInput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

/**
 *  Input protocol for Picture Service
 */

@protocol PictureServiceInput <NSObject>

/**
 *  Method for image loading
 */
- (void)loadPicture;

@end

