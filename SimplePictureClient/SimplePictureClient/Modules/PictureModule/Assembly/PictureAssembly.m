//
//  PictureAssembly.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureAssembly.h"
#import "PictureViewController.h"
#import "PictureService.h"
#import "PictureInteractor.h"
#import "PicturePresenter.h"
#import "CustomToast.h"
#import "ImageLoader.h"
#import "PictureXMLParser.h"

@implementation PictureAssembly

+ (void)createDependenciesOnPictureModule:(PictureViewController *)viewController {
    PictureService *service = [[PictureService alloc] init];
    PictureInteractor *interactor = [[PictureInteractor alloc] init];
    PicturePresenter *presenter = [[PicturePresenter alloc] init];
    CustomToast *toast = [[CustomToast alloc] init];
    ImageLoader *imageLoader = [[ImageLoader alloc] init];
    PictureXMLParser *xmlParser = [[PictureXMLParser alloc] init];
    
    viewController.output = presenter;
    viewController.toast = toast;
    presenter.view = viewController;
    presenter.interactor = interactor;
    interactor.pictureService = service;
    interactor.delegate = presenter;
    service.delegate = interactor;
    service.loader = imageLoader;
    service.parser = xmlParser;
    
}

@end
