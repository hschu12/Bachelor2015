//
//  SpotifyViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 28/04/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "SpotifyViewController.h"

@interface SpotifyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *spot;

@end

@implementation SpotifyViewController

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
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://play.spotify.com/user/tf2015/playlist/7a5vKBFSjFkjI2v1FE2OXF"]];

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
