//
//  PictureXMLParser.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 16/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureXMLParser.h"
#import "GDataXMLNode.h"
#import "GDataXMLElement+Additional.h"

@implementation PictureXMLParser

- (void)parseXMLData:(NSData *)data success:(ParseXMLPictureSuccess)success failure:(ParseXMLPictureFailure)failure {
    NSString *xmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSError* error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xmlString encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        NSString *urlString = [self parseXMLString:doc.rootElement];
        if (success) {
            success(urlString);
        }
    } else {
        if (failure) {
            failure(error);
        }
    }
}

#pragma mark - private
/**
 *  Check root element
 *  According to xml structure, go deep node by node until find url
 *  If url found - break the loop and return value, else return nil
 */
- (NSString *)parseXMLString:(GDataXMLElement *)rootElement {
    NSString *result = nil;
    if ([rootElement.name isEqualToString:@"response"]) {
        NSArray *data = [rootElement elementsForName:@"data"];
        for (GDataXMLElement *element in data) {
            NSArray *images = [element elementsForName:@"images"];
            for (GDataXMLElement *img in images) {
                NSArray *image = [img elementsForName:@"image"];
                for (GDataXMLElement *url in image) {
                    result = [url ect_valueForChild:@"url"];
                    if (result != nil) {
                        return result;
                    }
                }
            }
        }
    }
    return nil;
}

@end
