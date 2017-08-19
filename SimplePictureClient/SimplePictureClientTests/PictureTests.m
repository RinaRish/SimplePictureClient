//
//  PictureTests.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 18/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Picture.h"

@interface PictureTests : XCTestCase

@end

@implementation PictureTests

- (void)testInit {
    UIImage *testImage = [UIImage new];
    Picture *picture = [[Picture alloc] initWithImage:testImage];
    XCTAssertNotNil(picture);
    XCTAssertEqualObjects(picture.image, testImage);
}

@end
