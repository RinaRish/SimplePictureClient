//
//  PictureService.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PictureServiceInput.h"
#import "PictureServiceOutput.h"

@class PictureXMLParser, ImageLoader, AFURLSessionManager;

/**
 *  Picture Service
 */

@interface PictureService : NSObject <PictureServiceInput>

@property (nonatomic, weak) id<PictureServiceOutput> delegate;

@property (nonatomic, strong) PictureXMLParser *parser;

@property (nonatomic, strong) ImageLoader *loader;

@property (nonatomic, strong) AFURLSessionManager *manager;

@property (nonatomic, copy) NSURLRequest *request;

@end
