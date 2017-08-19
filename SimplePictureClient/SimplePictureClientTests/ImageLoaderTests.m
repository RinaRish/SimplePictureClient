//
//  ImageLoaderTests.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 18/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "ImageLoader.h"

#import "Picture.h"

@interface ImageLoaderTests : XCTestCase

@property (nonatomic, strong) ImageLoader *imageLoader;

@end

@implementation ImageLoaderTests

- (void)setUp {
    [super setUp];

    self.imageLoader = [ImageLoader new];
}

- (void)tearDown {
    self.imageLoader = nil;
    
    [super tearDown];
}

- (void)testImageLoaderSuccess {
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation for success loading"];
    
    NSURL *testURL = [NSURL URLWithString:@"http://25.media.tumblr.com/tumblr_m0gyw4jDJY1qzfd8bo1_1280.jpg"];
    id nsdataMock = OCMClassMock([NSData class]);
    id imageMock = OCMClassMock([UIImage class]);
    NSError *error = nil;
    OCMExpect([nsdataMock dataWithContentsOfURL:[OCMArg isEqual:testURL] options:NSDataReadingMappedIfSafe error:[OCMArg setTo:error]]).andReturn(nsdataMock);
    OCMExpect([imageMock imageWithData:[OCMArg isEqual:nsdataMock]]).andReturn(imageMock);
    
    __block Picture *receivedPicture = nil;
    __block NSError *receivedError = nil;
    [self.imageLoader loadPictureWithURL:testURL success:^(Picture *picture) {
        receivedPicture = picture;
        [expectation fulfill];
    } failure:^(NSError *error) {
        receivedError = error;
    }];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(receivedError);
        XCTAssertNotNil(receivedPicture);
        XCTAssertEqualObjects(receivedPicture.image, imageMock);
        OCMVerifyAll(nsdataMock);
        OCMVerifyAll(imageMock);
    }];
}

- (void)testImageLoaderFailure {
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation for failure loading"];
    
    id nsdataMock = OCMClassMock([NSData class]);
    NSError *expectedError = [NSError new];
    OCMExpect([nsdataMock dataWithContentsOfURL:[OCMArg isNil] options:NSDataReadingMappedIfSafe error:[OCMArg setTo:expectedError]]).andReturn(nil);
    
    __block Picture *receivedPicture = nil;
    __block NSError *receivedError = nil;
    [self.imageLoader loadPictureWithURL:nil success:^(Picture *picture) {
        receivedPicture = picture;
    } failure:^(NSError *error) {
        receivedError = error;
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(receivedPicture);
        XCTAssertEqualObjects(receivedError, expectedError);
        OCMVerifyAll(nsdataMock);
    }];
}

@end
