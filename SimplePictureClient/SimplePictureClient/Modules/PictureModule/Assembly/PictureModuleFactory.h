//
//  PictureModelFactory.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Module creation and assembling
 */

@interface PictureModuleFactory : NSObject

+ (UIViewController *)createPictureViewController;

@end
