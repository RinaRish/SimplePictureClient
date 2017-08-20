//
//  ImageLoader.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 16/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Picture;

typedef void(^LoadPictureSuccess)(Picture *picture);
typedef void(^LoadPictureFailure)(NSError *error);

/**
 *  Object, which loads image
 */

@interface ImageLoader : NSObject

/**
 *  Method loads image by URL and returns success/failure
 */
- (void)loadPictureWithURL:(NSURL *)url success:(LoadPictureSuccess)success failure:(LoadPictureFailure)failure;

@end
