//
//  PictureXMLParserTests.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 18/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import "PictureXMLParser.h"

@interface PictureXMLParserTests : XCTestCase

@end

@implementation PictureXMLParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testPictureXMLParserSuccess {
    ParseXMLPictureSuccess successBlock;
    ParseXMLPictureFailure failureBlock;
    id mockParser = [OCMockObject mockForClass:[PictureXMLParser class]];
    id mockURLString = [OCMockObject mockForClass:[NSString class]];
    [[mockParser expect] parseXMLData:[OCMArg isNotNil] success:successBlock failure:failureBlock];
    [[[mockParser stub] andReturn:mockURLString] parseXMLData:[OCMArg isNotNil] success:successBlock failure:failureBlock];
}

- (void)testPictureXMLParserError {
    ParseXMLPictureSuccess successBlock;
    ParseXMLPictureFailure failureBlock;
    id mockParser = [OCMockObject mockForClass:[PictureXMLParser class]];
    id mockError = [OCMockObject mockForClass:[NSError class]];
    [[mockParser expect] parseXMLData:[OCMArg any] success:successBlock failure:failureBlock];
    [[[mockParser stub] andReturn:mockError] parseXMLData:[OCMArg isNotNil] success:successBlock failure:failureBlock];
}

@end
