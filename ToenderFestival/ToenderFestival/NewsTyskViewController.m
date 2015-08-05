//
//  NewsTyskViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 05/08/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "NewsTyskViewController.h"

@interface NewsTyskViewController ()

@end

@implementation NewsTyskViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    NSURL *myURL = [NSURL URLWithString: @"http://tf.dk/de/nyheder/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('header-sticky').style.display = 'none'"];
}

@end

