//
//  PictureInteractor.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PictureInteractorInput.h"
#import "PictureInteractorOutput.h"
#import "PictureServiceOutput.h"

/**
 *  Layer, which links Presenter and PictureService
 */

@protocol PictureServiceInput;

@interface PictureInteractor : NSObject <PictureInteractorInput, PictureServiceOutput>

@property (nonatomic, weak) id<PictureInteractorOutput> delegate;
@property (nonatomic, strong) id<PictureServiceInput> pictureService;

@end
