//
//  PictureViewController.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureViewInput.h"
#import "PictureViewOutput.h"

@class CustomToast;

/**
 *  UI Layer
 */

@interface PictureViewController : UIViewController <PictureViewInput>

/**
 *  Image
 */
@property (weak, nonatomic) IBOutlet UIImageView *picture;

/**
 *  Loading indicator
 */
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

/**
 *  Link to picture output protocol
 */
@property (nonatomic, strong) id <PictureViewOutput> output;

/**
 *  Link to toast object
 */
@property (nonatomic, strong) CustomToast *toast;

@end
