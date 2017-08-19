//
//  PictureViewController.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureViewController.h"
#import "CustomToast.h"
#import "Picture.h"

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didLoadView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

#pragma mark - PictureViewInput

- (void)showLoadingIndicator {
    self.picture.image = nil;
    [self.activityIndicator startAnimating];
}

- (void)hideLoadingIndicator {
    [self.activityIndicator stopAnimating];
}

- (void)showPrompt:(NSString *)prompt {
    [self.toast displayToastWithMessage:prompt onView:self.view];
}

- (void)displayPicture:(Picture *)picture {
    self.picture.image = picture.image;
}

-(void)displayErrorMessage:(NSString *)errorMessage {
    [self.toast displayToastWithMessage:errorMessage onView:self.view];
}

#pragma mark - Motion Action

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self.output reloadPicture];
}

@end
