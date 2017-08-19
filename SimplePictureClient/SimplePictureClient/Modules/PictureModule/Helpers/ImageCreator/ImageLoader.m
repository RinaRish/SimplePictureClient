//
//  ImageLoader.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 16/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "ImageLoader.h"
#import "Picture.h"

@implementation ImageLoader

- (void)loadPictureWithURL:(NSURL *)url success:(LoadPictureSuccess)success failure:(LoadPictureFailure)failure {
    NSError* error;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
    if (!error) {
        UIImage *image = [UIImage imageWithData:data];
        Picture *picture = [[Picture alloc] initWithImage:image];
        if (success != nil) {
            success(picture);
        }
    } else {
        if (failure != nil) {
            failure(error);
        }
    }
}

@end
