//
//  PictureXMLParser.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 16/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ParseXMLPictureSuccess)(NSString *result);

typedef void(^ParseXMLPictureFailure)(NSError *error);

/**
 *  XML Parser
 */

@interface PictureXMLParser : NSObject

/**
 *  Method parses xml and returns success/failure
 */
- (void)parseXMLData:(NSData *)data success:(ParseXMLPictureSuccess)success failure:(ParseXMLPictureFailure)failure;

@end
