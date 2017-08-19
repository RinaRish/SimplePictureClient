//
//  PictureViewOutput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

/**
 *  View Output protocol
 */

@protocol PictureViewOutput <NSObject>
/**
 *  Method called, when UI layer loaded
 */
- (void)didLoadView;

/**
 *  Method loads new picture
 */
- (void)reloadPicture;

@end




