//
//  CustomToast.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 17/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIView;

/**
 *  Objects which serves as notification
 */

@interface CustomToast : NSObject
/**
 *  Method, which dispays notification
 */
- (void)displayToastWithMessage:(NSString *)message onView:(UIView *)view;

@end
