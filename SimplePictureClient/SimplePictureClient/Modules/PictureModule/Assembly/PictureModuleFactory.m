//
//  PictureModelFactory.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureModuleFactory.h"
#import "PictureViewController.h"
#import "PictureAssembly.h"

static NSString *const kPictureVCIdentifier = @"PictureViewControllerIdentifier";
static NSString *const kMainStoryboardIdentifier = @"Main";

@implementation PictureModuleFactory

+ (UIViewController *)createPictureViewController {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kMainStoryboardIdentifier bundle:bundle];
    PictureViewController *pVC = [storyboard instantiateViewControllerWithIdentifier:kPictureVCIdentifier];
    [PictureAssembly createDependenciesOnPictureModule:pVC];
    return pVC;
}

@end
