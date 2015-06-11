//
//  FridayProgramTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 10/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "FridayProgramTableViewController.h"

@interface FridayProgramTableViewController (){
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}

@end

@implementation FridayProgramTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    spilletider = @{@" 10:00" : @[@"10:00 - folkBALTICA Ensemble", @"10:15 - Greg Russell & Ciaran Algar"],
                    @" 11:00" : @[@"11:00 - Mánran"],
                    @" 12:00" : @[@"12:00 - Spiro"],
                    @" 13:00" : @[@"13:00 - Skerryvore", @"13:00 - DR P4 Madsen Live", @"13:45 - Allan Taylor"],
                    @" 14:00" : @[@"14:00 - Greg Russell & Ciaran Algar"],
                    @" 15:00" : @[@"15:30 - Adam Holmes & The Embers", @"15:45 - Fara"],
                    @" 16:00" : @[@"16:00 - Danú", @"DR P5 Live"],
                    @" 17:00" : @[@"17:00 - Folk Spot, Maja & David", @"17:15 - Sheesham, Lotus & ‘Son", @"17:30 - The Hot Seats"],
                    @" 18:00" : @[@"18:00 - Folk Spot, MC Hansen", @"18:30 - Rura", @"18:30 - Hot Rize", @"18:45 - Ten Strings And A Goat Skin"],
                    @" 19:00" : @[@"19:15 - Rod"],
                    @" 20:00" : @[@"20:00 - Folkeklubben", @"20:00 - Folk Spot, Jansberg", @"20:00 - Chris Smither", @"20:30 - Bellowhead"],
                    @" 21:00" : @[@"21:00 - Three Tall Pines"],
                    @" 22:00" : @[@"22:00 - Kepa Junkera", @"22:15 - Mike Andersen", @"22:30 - Kathryn Tickell & The Side"],
                    @" 23:00" : @[@"23:15 - Fanø/Cape Breton Night", @"23:30 - La Bottine Souriante", @"23:45 - Barra Mac Neils"],
                    @"00:00" : @[@"00:00 - The Great Malarkey", @"00:45 - Mames Babegenush"],
                    @"01:00" : @[@"01:15 - Fanø Bal", @"01:15 - King James & The Special Men"]};
    
    scene = @{@" 10:00" : @[@"Open Air", @"Open Air"],
              @" 11:00" : @[@"Open Air"],
              @" 12:00" : @[@"La Gayola"],
              @" 13:00" : @[@"Telt 1", @"P4 Scenen", @"Palais Des Glaces"],
              @" 14:00" : @[@"Visemøllen"],
              @" 15:00" : @[@"La Gayola", @"Visemøllen"],
              @" 16:00" : @[@"Telt 2", @"P4 Scenen"],
              @" 17:00" : @[@"P4 Scenen", @"Palais Des Glaces", @"Visemøllen"],
              @" 18:00" : @[@"P4 Scenen", @"Open Air", @"Telt 1", @"La Gayola"],
              @" 19:00" : @[@"Visemøllen"],
              @" 20:00" : @[@"Telt 1", @"P4 Scenen", @"Palais Des Glaces", @"Open Air"],
              @" 21:00" : @[@"Visemøllen"],
              @" 22:00" : @[@"Museet", @"Telt 2", @"Palais Des Glaces"],
              @" 23:00" : @[@"P4 Scenen", @"Telt 1", @"Museet"],
              @"00:00" : @[@"La Gayola", @"Telt 2"],
              @"01:00" : @[@"P4 Scenen", @"Palais Des Glaces"]};
    
    
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
