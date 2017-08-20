//
//  PicturePresenter.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PictureViewOutput.h"
#import "PictureInteractorOutput.h"

/**
 *  Layer, which prepares content for display and can respond to user input 
 */

@protocol PictureViewInput, PictureInteractorInput;

@interface PicturePresenter : NSObject <PictureViewOutput, PictureInteractorOutput>

@property (nonatomic, weak) id<PictureViewInput> view;
@property (nonatomic, strong) id<PictureInteractorInput> interactor;

@end
