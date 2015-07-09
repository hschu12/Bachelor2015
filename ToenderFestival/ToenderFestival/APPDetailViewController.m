//
//  APPDetailViewController.m
//  RSSreader
//
//  Created by Rafael Garcia Leiva on 08/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPDetailViewController.h"

@implementation APPDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    NSURL *myURL = [NSURL URLWithString: @"http://tf.dk"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('header-sticky').style.display = 'none'"];
}

@end
