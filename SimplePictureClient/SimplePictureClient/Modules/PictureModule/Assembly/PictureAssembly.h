//
//  PictureAssembly.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PictureViewController;

/**
 *  Object, which is responsible for module assembling
 */

@interface PictureAssembly : NSObject

+ (void)createDependenciesOnPictureModule:(PictureViewController *)viewController;

@end
