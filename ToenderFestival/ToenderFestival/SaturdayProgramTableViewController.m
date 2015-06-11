//
//  SaturdayProgramTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 10/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "SaturdayProgramTableViewController.h"

@interface SaturdayProgramTableViewController (){
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}


@end

@implementation SaturdayProgramTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    spilletider = @{@" 11:00" : @[@"11:00 - Maja & David", @"11:30 - Ron Kavana"],
                    @" 12:00" : @[@"12:30 - The Chaissons"],
                    @" 13:00" : @[@"13:00 - Wailin’Jennys", @"13:00 - Three Tall Pines"],
                    @" 14:00" : @[@"14:00 - Band Battle New Orleans Style", @"14:00 - DR P4 Madsen Live", @"14:00 - The Beatons", @"14:15 - Allan Taylor"],
                    @" 15:00" : @[@"15:00 - Poul Krebs & Friends", @"15:30 - Adam Holmes & The Embers", @"15:30 - The MacGillivrays"],
                    @" 16:00" : @[@"16:00 - DR P5 Folk på 5'eren Live", @"16:30 - Mary Gauthier", @"16:45 - Greg Russell & Claran Algar"],
                    @" 17:00" : @[@"17:00 - FolkSpot, Phønix", @"17:00 - The Dewars", @"17:30 - The Lone Bellow"],
                    @" 18:00" : @[@"18:00 - FolkSpot, Ida Wenøe", @"18:00 - Niels Hausgaard med gæster"],
                    @" 19:00" : @[@"19:15 - La Bottine Souriante", @"19:30 - Lynn Miles"],
                    @" 20:00" : @[@"20:00 - Townes Van Zandt Tribute", @"20:00 - FolkSpot, Erlend Viken Trio", @"20:45 - The Stray Birds"],
                    @" 21:00" : @[@"21:00 - Skerryvore", @"21:00 - FolkSpot, Lukkif", @"21:00 - Neanders"],
                    @" 22:00" : @[@"22:00 - Eleanor Shanley", @"22:00 - The East Pointers", @"22:00 - Helene Blum & Harald Haugaard Band"],
                    @" 23:00" : @[@"23:00 - Sheesham, Lotus & ‘Son", @"23:15 - Jonah Blacksmith",  @"23:30 - The Wood Brothers", @"23:45 - Spiro"],
                    @"00:00" : @[@"00:15 - The Hot Seats", @"00:45 - Bros Landreth"],
                    @"01:00" : @[@"01:00 - The Sexican", @"01:15 - King James & The Special Men"]};
    
    scene = @{@" 11:00" : @[@"Visemøllen", @"La Gayola"],
              @" 12:00" : @[@"Visemøllen"],
              @" 13:00" : @[@"Telt 2", @"Palais Des Glaces"],
              @" 14:00" : @[@"Open Air", @"P4 Scenen", @"Visemøllen", @"La Gayola"],
              @" 15:00" : @[@"Telt 1", @"Palais Des Glaces", @"Visemøllen"],
              @" 16:00" : @[@"P4 Scenen", @"Telt 2", @"La Gayola"],
              @" 17:00" : @[@"P4 Scenen", @"Visemøllen", @"Open Air"],
              @" 18:00" : @[@"P4 Scenen, Ida Wenøe", @"Palais Des Glaces"],
              @" 19:00" : @[@"Open Air", @"La Gayola"],
              @" 20:00" : @[@"Telt 1", @"P4 Scenen", @"Palais Des Glaces"],
              @" 21:00" : @[@"Open Air", @"P4 Scenen", @"Visemøllen"],
              @" 22:00" : @[@"Telt 1", @"La Gayola", @"Museet"],
              @" 23:00" : @[@"Palais Des Glaces", @"P4 Scenen",  @"Telt 2", @"Museet"],
              @"00:00" : @[@"La Gayola", @"P4 Scenen"],
              @"01:00" : @[@"Telt 2", @"Palais Des Glaces"]};
    
    
    spilletiderSections = [[spilletider allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor colorWithRed:170.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor blackColor]];
    
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