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

@end

@implementation PictureServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//- (void)testExample
//{
//    Example *exampleOrig = [[Example alloc] init];
//    id loginCntrl = [OCMockObject mockForClass:[ExampleLC class]];
//    [[[loginCntrl expect] andDo:^(NSInvocation *invocation) {
//        void (^successBlock)(NSString *authToken) = [invocation getArgumentAtIndexAsObject:3];
//        successBlock(@"Dummy");
//    }] loginWithUserPass:OCMOCK_ANY withSuccess:OCMOCK_ANY failure:OCMOCK_ANY];
//    exampleOrig->_loginCntrl = loginCntrl;
//    id example = [OCMockObject partialMockForObject:exampleOrig];
//    [[example expect] saveToken:@"Dummy"];
//    [example loginWithUser:@"ABC" andPass:@"DEF"];
//    [loginCntrl verify];
//    [example verify];
//}

- (void)testInit {
    NSURL *testURL = [NSURL URLWithString:@"htpp:/test"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:testURL];
    XCTAssertNotNil(request);
    XCTAssertEqualObjects(request.URL, testURL);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    XCTAssertNotNil(manager);
}

- (void)testLoadPicture {
    /**
     *  Создать мок сервиса и сд
     */
    id mockService = [OCMockObject mockForClass:[PictureService class]];
    OCMVerify([mockService loadPicture]);
    //проверить что после вызова loadPicture через делегат картинка передается
    ParseXMLPictureSuccess succesBlock;
    ParseXMLPictureFailure failureBlock;
    id mockParser = [OCMockObject mockForClass:[PictureXMLParser class]];
    [[[mockParser stub] andReturn:succesBlock] parseXMLData:[OCMArg isNotNil] success:[OCMArg isNotNil] failure:[OCMArg isNotNil]];
    [[mockParser expect] parseXMLData:[OCMArg isNotNil] success:succesBlock failure:failureBlock];
    OCMVerify([mockParser parseXMLData:[OCMArg isNotNil] success:[OCMArg isNotNil] failure:[OCMArg isNotNil]]);
    
    LoadPictureSuccess plSuccesBlock;
    LoadPictureFailure plFailureBlock;
    Picture *pic;
    id mockLoader = [OCMockObject mockForClass:[ImageLoader class]];
    [[[mockLoader stub] andReturn:pic] loadPictureWithURL:[OCMArg isNotNil] success:[OCMArg isNotNil] failure:[OCMArg isNotNil]];
    [[mockLoader expect] loadPictureWithURL:[OCMArg isNotNil] success:plSuccesBlock failure:plFailureBlock];
    
    id mockManager = [OCMockObject mockForClass:[AFURLSessionManager class]];
    id mockRequest = [OCMockObject mockForClass:[NSURLRequest class]];
    
    
    /**
     *  1. создать мок парсера и сделать стаб его метода
     *  2. проверить что парсер вернул строку (equalobjects или notNil)
     *  3. создать мок лоадера и сделать стаб его метода
     *  4. проверить что лоадер вернул картинку (equalobjects или notNil)
     *  5. проверить что картинка передалась делегату
     */
    
    NSString *expectedURL = @"http://25.media.tumblr.com/tumblr_m0gyw4jDJY1qzfd8bo1_1280.jpg";
    
    OCMStub([mockParser parseXMLData:[OCMArg isNotNil] success:[OCMArg invokeBlock] failure:[OCMArg invokeBlock]]);
    
    
}



@end
