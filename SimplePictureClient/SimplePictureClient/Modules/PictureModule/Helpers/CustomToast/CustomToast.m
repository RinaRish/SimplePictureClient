//
//  CustomToast.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "CustomToast.h"
#import "UIView+Toast.h"

static const CGFloat kCustomToastDuration = 3.0;

@implementation CustomToast

-(void)displayToastWithMessage:(NSString *)message onView:(UIView *)view {
    [view makeToast:message
           duration:kCustomToastDuration
           position:CSToastPositionBottom];
}

@end
