//
//  KunstnerViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 15/04/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "KunstnerViewController.h"

@interface KunstnerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;


@end

@implementation KunstnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    [self.text setBackgroundColor:[UIColor clearColor]];
    [self.text scrollRangeToVisible:NSMakeRange(0, 0)];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
