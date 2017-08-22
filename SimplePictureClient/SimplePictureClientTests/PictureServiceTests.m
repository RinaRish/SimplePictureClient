//
//  PictureServiceTests.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 18/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import "PictureService.h"
#import "PictureXMLParser.h"
#import "ImageLoader.h"
#import "AFURLSessionManager.h"

@interface PictureServiceTests : XCTestCase

@property (nonatomic, strong) PictureService *pictureService;
@property (nonatomic, weak) id<PictureServiceOutput> delegateMock;
@property (nonatomic, strong) PictureXMLParser *parserMock;
@property (nonatomic, strong) ImageLoader *loaderMock;
@property (nonatomic, strong) AFURLSessionManager *managerMock;
@property (nonatomic, copy) NSURLRequest *requestMock;

@end

@implementation PictureServiceTests

- (void)setUp {
    [super setUp];
    
    self.pictureService = [PictureService new];
    self.delegateMock = OCMProtocolMock(@protocol(PictureServiceOutput));
    self.parserMock = OCMClassMock([PictureXMLParser class]);
    self.loaderMock = OCMClassMock([ImageLoader class]);
    self.managerMock = OCMClassMock([AFURLSessionManager class]);
    self.requestMock = OCMClassMock([NSURLRequest class]);
    
    self.pictureService.delegate = self.delegateMock;
    self.pictureService.parser = self.parserMock;
    self.pictureService.loader = self.loaderMock;
    self.pictureService.manager = self.managerMock;
    self.pictureService.request = self.requestMock;
}

- (void)tearDown {
    self.delegateMock = nil;
    self.parserMock = nil;
    self.loaderMock = nil;
    self.managerMock = nil;
    self.requestMock = nil;
    self.pictureService = nil;
    
    [super tearDown];
}

- (void)testInit {
    NSURL *testURL = [NSURL URLWithString:@"htpp:/test"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:testURL];
    XCTAssertNotNil(request);
    XCTAssertEqualObjects(request.URL, testURL);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    XCTAssertNotNil(manager);
}

@end
