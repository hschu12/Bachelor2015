//
//  BilleterViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 17/07/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "BilleterViewController.h"

@interface BilleterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *spot;

@end

@implementation BilleterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)linked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tonderfestival.billetten.dk/?q=2479c10c-153f-44c1-a811-210b24ddae6b&p=7539f109-9991-49c0-b951-569f6c9830a8&ts=1437132387&c=billetten&e=2015q2&rt=Safetynet&h=c40b5d6703cc62740b5b35af207f3e4d"]];
    
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