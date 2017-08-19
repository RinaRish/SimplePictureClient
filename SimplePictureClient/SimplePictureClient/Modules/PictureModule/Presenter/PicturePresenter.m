//
//  PicturePresenter.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PicturePresenter.h"
#import "PictureViewInput.h"
#import "PictureInteractorInput.h"

static NSString *const kPromptMessage = @"Shake device to see another picture";
static NSString *const kErrorMessage = @"Unknown error occured. Try again later";

@implementation PicturePresenter

#pragma mark - PictureViewOutput

- (void)reloadPicture {
    [self askForNewPicture];
}

- (void)didLoadView {
    [self askForNewPicture];
    [self.view showPrompt:kPromptMessage];
}

#pragma mark - PictureInteractorOutput

- (void)didFailToLoadPictureWithError:(NSError *)error {
    [self.view hideLoadingIndicator];
    NSString *errorMessage = error.userInfo[NSLocalizedDescriptionKey];
    [self.view displayErrorMessage:errorMessage ? errorMessage : kErrorMessage];
}

- (void)didLoadPicture:(Picture *)picture {
    [self.view hideLoadingIndicator];
    [self.view displayPicture:picture];
}

#pragma mark - 

- (void)askForNewPicture {
    [self.view showLoadingIndicator];
    [self.interactor fetchNewPicture];
}

@end
