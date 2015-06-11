//
//  ThursdayProgramTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 08/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "ThursdayProgramTableViewController.h"

@interface ThursdayProgramTableViewController () {
NSDictionary *spilletider;
NSDictionary *scene;
NSArray *spilletiderSections;
}
@end

@implementation ThursdayProgramTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    spilletider = @{@"12:00" : @[@"12:30 - Festivalåbning", @"12:45 - Ten Strings And A Goat Skin"],
                    @"13:00" : @[@"13:00 - DR P4 Madsen Live", @"13:15 - Canadisk mashup"],
                    @"14:00" : @[@"14:45 - Ten Strings And A Goat Skin"],
                    @"16:00" : @[@"16:00 - Hayseed Dixie", @"16:00 - Kathryn Tickell & The Side", @"16:30 - The Stray Birds"],
                    @"18:00" : @[@"18:00 - Chris Smither", @"18:00 - The Great Malarkey", @"18:15 - Fara", @"18:15 - Ron Kavana"],
                    @"19:00" : @[@"19:30 - Richard Thompson"],
                    @"20:00" : @[@"20:00 - Hot Rize", @"20:00 - Richard J. Dobson", @"20:15 - Hans Theessink"],
                    @"21:00" : @[@"21:15 - Bros Landreth", @"21:45 - Jacob Dinesen", @"21:45 - King James & The Special Men"],
                    @"22:00" : @[@"22:00 - The Hot Seats", @"22:30 - Sturgill Simpson"],
                    @"23:00" : @[@"23:30 - Mánran", @"23:45 - Meschiya Lake & The Little Big Horns"]};
    
    scene = @{@"12:00" : @[@"Open Air", @"Open Air"],
                    @"13:00" : @[@"P4 Scenen", @"Open Air"],
                    @"14:00" : @[@"P4 Scenen"],
                    @"16:00" : @[@"Open Air", @"Telt 1", @"Palais Des Glaces"],
                    @"18:00" : @[@"Telt 2", @"P4 Scenen", @"La Gayola", @"Visemøllen"],
                    @"19:00" : @[@"Telt 1"],
                    @"20:00" : @[@"Open Air", @"Visemøllen", @"Palais Des Glaces"],
                    @"21:00" : @[@"Telt 2", @"Visemøllen", @"P4 Scenen"],
                    @"22:00" : @[@"La Gayola", @"Telt 1"],
                    @"23:00" : @[@"P4 Scenen", @"Palais Des Glaces"]};

    
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
