//
//  InfoTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 12/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "InfoTableViewController.h"

@interface InfoTableViewController (){
    NSDictionary *spilletider;
    NSArray *spilletiderSections;
}

@end

@implementation InfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    
    spilletider = @{@"Billetter og Armbånd" : @[@"Armbånd", @"Køb Billet"],
                    @"Det Praktiske" :@[@"Apotek og Samaritter", @"Camping", @"Parkering",
                                        @"Offentlig Transport", @"Tabte Sager"],
                    @"Festivalen" : @[@"Kontakt", @"Sponsorer"],
                    };
    
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

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor colorWithRed:170.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor blackColor]];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [spilletiderSections objectAtIndex:indexPath.section];
    NSArray *sectionTider = [spilletider objectForKey:sectionTitle];
    NSString *tider = [sectionTider objectAtIndex:indexPath.row];
    cell.textLabel.text = tider;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *celltext = cell.textLabel.text;
    //"Billetter og Armbånd"
    if ([celltext  isEqual: @"Armbånd"]) {
        [self performSegueWithIdentifier:@"Armbånd" sender:self];
    }
    if ([celltext  isEqual: @"Køb Billet"]) {
        [self performSegueWithIdentifier:@"Billet" sender:self];
    }
    //"Praktisk"
    if ([celltext  isEqual: @"Apotek og Samaritter"]) {
        [self performSegueWithIdentifier:@"Apotek" sender:self];
    }
    if ([celltext  isEqual: @"Camping"]) {
        [self performSegueWithIdentifier:@"Camping" sender:self];
    }
    if ([celltext  isEqual: @"Parkering"]) {
        [self performSegueWithIdentifier:@"Parkering" sender:self];
    }
    if ([celltext  isEqual: @"Offentlig Transport"]) {
        [self performSegueWithIdentifier:@"Offentlig" sender:self];
    }
    if ([celltext  isEqual: @"Tabte Sager"]) {
        [self performSegueWithIdentifier:@"Tabte" sender:self];
    }
    //"Festivalen"
    if ([celltext  isEqual: @"Kontakt"]) {
        [self performSegueWithIdentifier:@"Kontakt" sender:self];
    }
    if ([celltext  isEqual: @"Sponsorer"]) {
        [self performSegueWithIdentifier:@"Sponsorer" sender:self];
    }
    //"Om Appen
    if ([celltext  isEqual: @"Credits"]) {
        [self performSegueWithIdentifier:@"Credits" sender:self];
    }
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


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

@end
