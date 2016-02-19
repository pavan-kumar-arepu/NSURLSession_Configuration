//
//  ViewController.m
//  Sessions
//
//  Created by Pavankumar Arepu on 16/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create Session Configuration
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Configure Session Configuration
    [sessionConfiguration setAllowsCellularAccess:YES];
    [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
    
    // Create Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    // Send Request
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]);
      }] resume];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
