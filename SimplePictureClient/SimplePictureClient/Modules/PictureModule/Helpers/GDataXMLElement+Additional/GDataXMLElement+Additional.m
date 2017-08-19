//
//  GDataXMLElement+Additional.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "GDataXMLElement+Additional.h"

@implementation GDataXMLElement (Additional)

- (NSString *)ect_valueForChild:(NSString *)childName {
    return [[self ect_elementForChild:childName] stringValue];
}

- (GDataXMLElement *)ect_elementForChild:(NSString *)childName {
    NSArray *children = [self elementsForName:childName];
    if (children.count > 0) {
        GDataXMLElement *childElement = (GDataXMLElement *)children[0];
        return childElement;
    } else return nil;
}

@end
