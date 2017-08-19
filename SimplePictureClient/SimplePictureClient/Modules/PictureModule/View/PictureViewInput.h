//
//  PictureViewInput.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

@class Picture;

/**
 *  View Input protocol
 */

@protocol PictureViewInput <NSObject>
/**
 *  Method displays state of loading
 */
- (void)showLoadingIndicator;
/**
 *  Method hides state of loading
 */
- (void)hideLoadingIndicator;
/**
 *  Method displays hint for user
 */
- (void)showPrompt:(NSString *)prompt;
/**
 *  Method displays image
 */
- (void)displayPicture:(Picture *)picture;
/**
 *  Method displays error message
 */
- (void)displayErrorMessage:(NSString *)errorMessage;

@end


