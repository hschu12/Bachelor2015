//
//  EventDKTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 08/07/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "EventDKTableViewController.h"

@interface EventDKTableViewController (){
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}
@end

@implementation EventDKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    
    spilletider = @{@"27/8 - Torsdag" : @[@"5km Løb"],
                    @"28/8 - Fredag" : @[@"5km Løb"],
                    @"29/8 - Lørdag" : @[@"10km Løb"],
                    @"30/8 - Søndag" : @[@"Spooky Coral"]
                    };
    
    
    
    scene = @{@"Torsdag" : @[@"Blues 'n' food"],
              @"Fredag" : @[@"Coffee and Cookies"],
              @"Lørdag" : @[@"Den Hemmelige"],
              @"Søndag" : @[@"Festivalscafeen"]
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
    NSArray *sectionScene = [scene objectForKey:sectionTitle];
    NSString *tider = [sectionTider objectAtIndex:indexPath.row];
    NSString *scener = [sectionScene objectAtIndex:indexPath.row];
    cell.textLabel.text = tider;
    cell.detailTextLabel.text = scener;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *celltext = cell.textLabel.text;
    //"B"
    /*if ([celltext  isEqual: @"Blues 'n' food"]) {
        [self performSegueWithIdentifier:@"Blues" sender:self];
    }
    //"C"
    if ([celltext  isEqual: @"Coffee and Cookies"]) {
        [self performSegueWithIdentifier:@"Cookies" sender:self];
    }
    //"D"
    if ([celltext  isEqual: @"Den Hemmelige"]) {
        [self performSegueWithIdentifier:@"Hemmelige" sender:self];
    }*/
    
}

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


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

@end
