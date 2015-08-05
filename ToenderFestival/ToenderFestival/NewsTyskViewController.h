//
//  NewsTyskViewController.h
//  ToenderFestival
//
//  Created by Henrik Schulz on 05/08/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTyskViewController : UIViewController

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
