//
//  SundayProgramTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 10/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "SundayProgramTableViewController.h"

@interface SundayProgramTableViewController (){
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}


@end

@implementation SundayProgramTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    spilletider = @{@"10:00" : @[@"10:30 - folkBALTICA Ensemble"],
                    @"11:00" : @[@"11:15 - Adam Holmes & The Embers"],
                    @"12:00" : @[@"12:00 - Dreamers' Circus & The Danish String Quartet", @"12:00 - Fara"],
                    @"13:00" : @[@"13:00 - Niels Hausgaard med gæster", @"13:30 - The Lone Bellow", @"13:30 - The Wailin’ Jennys"],
                    @"14:00" : @[@"14:15 - Sheesham, Lotus & ‘Son"],
                    @"15:00" : @[@"15:15 - The Wood Brothers", @"15:15 - Jacob Dinesen"],
                    @"16:00" : @[@"16:00 - DR P5 Folk på 5'eren live", @"16:30 - Eleanor Shanley"],
                    @"17:00" : @[@"17:00 - Mary Gauthier"],
                    @"18:00" : @[@"18:00 - Rura", @"18:45 - Lynn Miles"],
                    @"19:00" : @[@"19:00 - Usher's Island", @"19:00 - The Great Malarkey"],
                    @"20:00" : @[@"20:15 - Kepa Junkera"],
                    @"21:00" : @[@"21:00 - John Prine", @"21:45 - Mánran"],
                    @"22:00" : @[@"22:30 - Finale"],
                    @"23:00" : @[@"23:00 - Meschiya Lake & The Little Big Horns"]};
                    
    scene = @{@"10:00" : @[@"Telt 2"],
              @"11:00" : @[@"Palais Des Glaces"],
              @"12:00" : @[@"Telt 2", @"12:00 - Fara"],
              @"13:00" : @[@"Palais Des Glaces", @"Telt 1", @"Open Air"],
              @"14:00" : @[@"P4 Scenen"],
              @"15:00" : @[@"Open Air", @"La Gayola"],
              @"16:00" : @[@"P4 Scenen", @"Telt 2"],
              @"17:00" : @[@"Palais Des Glaces"],
              @"18:00" : @[@"Telt 2", @"La Gayola"],
              @"19:00" : @[@"Telt 1", @"P4 Scenen"],
              @"20:00" : @[@"Palais Des Glaces"],
              @"21:00" : @[@"Telt 1", @"P4 Scenen"],
              @"22:00" : @[@"Telt 1"],
              @"23:00" : @[@"Palais Des Glaces"]};
    
    
    spilletiderSections = [[spilletider allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor colorWithRed:170.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor blackColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [spilletiderSections count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [spilletiderSections objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSString *sectionTitle = [spilletiderSections objectAtIndex:section];
    NSArray *sectionTid = [spilletider objectForKey:sectionTitle];
    return [sectionTid count];
}
- (NSString *)getImageFilename:(NSString *)kunstner
{
    NSString *imageFilename = [[kunstner lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFilename = [imageFilename stringByAppendingString:@".png"];
    
    return imageFilename;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [spilletiderSections objectAtIndex:indexPath.section];
    NSArray *sectionTider = [spilletider objectForKey:sectionTitle];
    NSArray *sectionScene = [scene objectForKey:sectionTitle];
    NSString *tider = [sectionTider objectAtIndex:indexPath.row];
    NSString *scener = [sectionScene objectAtIndex:indexPath.row];
    cell.textLabel.text = tider;
    cell.detailTextLabel.text = scener;
    //cell.imageView.image = [UIImage imageNamed:[self getImageFilename:tider]];
    return cell;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end