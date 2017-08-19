//
//  GDataXMLElement+Additional.h
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

/**
 *  Category for simplified work with GDataXMLNode
 */

@interface GDataXMLElement (Additional)

/**
 *  Method returns node for child with given name
 */
- (GDataXMLElement *)ect_elementForChild:(NSString *)childName;

/**
 *  Method returns string value for a given child
 */
- (NSString *)ect_valueForChild:(NSString *)childName;

@end
