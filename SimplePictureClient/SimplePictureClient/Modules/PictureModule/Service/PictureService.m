//
//  PictureService.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "PictureService.h"
#import "AFURLSessionManager.h"
#import "PictureXMLParser.h"
#import "ImageLoader.h"
#import "Picture.h"

static NSString *const kCatAPIUrl = @"http://thecatapi.com/api/m/images/get?format=xml&results_per_page=1";

@implementation PictureService

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSURL *URL = [NSURL URLWithString:kCatAPIUrl];
        _request = [NSURLRequest requestWithURL:URL];
    }
    return self;
}

#pragma mark - PictureServiceInput

- (void)loadPicture {
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:self.request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        [weakSelf performLoadingPicture:responseObject error:error];
    }];
    [dataTask resume];
}

#pragma mark - private

- (void)performLoadingPicture:(id)responseObject error:(NSError *)error {
    __weak typeof(self) weakSelf = self;
    if (!error) {
        dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [self.parser parseXMLData:responseObject success:^(NSString *result) {
                [weakSelf.loader loadPictureWithURL:[NSURL URLWithString:result] success:^(Picture *picture) {
                    [weakSelf performBlockInMainQueue:^{
                        [weakSelf.delegate service:weakSelf didLoadPicture:picture];
                    }];
                } failure:^(NSError *loaderError) {
                    [weakSelf handleLoadingErrorInMainQueue:loaderError];
                }];
            
            } failure:^(NSError *parseError) {
                [weakSelf handleLoadingErrorInMainQueue:parseError];
            }];
        });
    } else {
        [self handleLoadingErrorInMainQueue:error];
    }
}

- (void)performBlockInMainQueue:(dispatch_block_t)block {
    dispatch_async( dispatch_get_main_queue(), ^{
        block();
    });
}

- (void)handleLoadingErrorInMainQueue:(NSError *)error {
    dispatch_async( dispatch_get_main_queue(), ^{
        [self.delegate service:self didFailToLoadURLWithError:error];
    });
}


@end
