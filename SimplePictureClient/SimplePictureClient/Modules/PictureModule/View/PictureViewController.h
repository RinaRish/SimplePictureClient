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

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) id <PictureViewOutput> output;
@property (nonatomic, strong) CustomToast *toast;

@end
