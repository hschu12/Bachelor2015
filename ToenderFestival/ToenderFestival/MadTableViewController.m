//
//  MadTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 12/06/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "MadTableViewController.h"

@interface MadTableViewController (){
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}


@end

@implementation MadTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    
    spilletider = @{@"B" : @[@"Blues 'n' food"],
                    @"C" : @[@"Coffee and Cookies"],
                    @"D" : @[@"Den Hemmelige"],
                    @"F" : @[@"Festivalscafeen", @"Fidlers Green", @"Fish'n'Chips", @"Furbar"],
                    @"G" : @[@"Grilltelt", @"Grill/Lam og Gris"],
                    @"I" : @[@"Irish Pub"],
                    @"K" : @[@"Kupeen"],
                    @"L" : @[@"Lounge med Bar"],
                    @"M" : @[@"Madbod", @"Marie Laveau", @"Mormors Køkken"],
                    @"N" : @[@"Nolabar"],
                    @"P" : @[@"Pandekager/Fastfood", @"Pølesvogn"],
                    @"R" : @[@"Rom og Cigarbar"],
                    @"S" : @[@"Sandwichbar", @"Schackenborg", @"SOS-bar", @"Spisestue med Bar", @"Steakhouse med lounge"],
                    @"V" : @[@"Vadehavstapas", @"Vaffelbod", @"Vinotek"],
                    @"W" : @[@"Wok"],
                    @"Ø" : @[@"Øko-bod", @"Ølbar"]
                    };
    
    
    
    scene = @{@"B" : @[@"Blues 'n' food"],
              @"C" : @[@"Coffee and Cookies"],
              @"D" : @[@"Den Hemmelige"],
              @"F" : @[@"Festivalscafeen", @"Fidlers Green", @"Fish'n'Chips", @"Furbar"],
              @"G" : @[@"Grilltelt", @"Grill/Lam og Gris"],
              @"I" : @[@"Irish Pub"],
              @"K" : @[@"Kupeen"],
              @"L" : @[@"Lounge med Bar"],
              @"M" : @[@"Madbod", @"Marie Laveau", @"Mormors Køkken"],
              @"N" : @[@"Nolabar"],
              @"P" : @[@"Pandekager/Fastfood", @"Pølesvogn"],
              @"R" : @[@"Rom og Cigarbar"],
              @"S" : @[@"Sandwichbar", @"Schackenborg", @"SOS-bar", @"Spisestue med Bar", @"Steakhouse med lounge"],
              @"V" : @[@"Vadehavstapas", @"Vaffelbod", @"Vinotek"],
              @"W" : @[@"Wok"],
              @"Ø" : @[@"Øko-bod", @"Ølbar"]
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

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return spilletiderSections;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *celltext = cell.textLabel.text;
    //"B"
    if ([celltext  isEqual: @"Blues 'n' food"]) {
        [self performSegueWithIdentifier:@"Blues" sender:self];
    }
    //"C"
    if ([celltext  isEqual: @"Coffee and Cookies"]) {
        [self performSegueWithIdentifier:@"Cookies" sender:self];
    }
    //"D"
    if ([celltext  isEqual: @"Den Hemmelige"]) {
        [self performSegueWithIdentifier:@"Hemmelige" sender:self];
    }
    //"F"
    if ([celltext  isEqual: @"Festivalscafeen"]) {
        [self performSegueWithIdentifier:@"cafe" sender:self];
    }
    if ([celltext  isEqual: @"Fidlers Green"]) {
        [self performSegueWithIdentifier:@"Green" sender:self];
    }
    if ([celltext  isEqual: @"Fish'n'Chips"]) {
        [self performSegueWithIdentifier:@"Chips" sender:self];
    }
    if ([celltext  isEqual: @"Furbar"]) {
        [self performSegueWithIdentifier:@"Fur" sender:self];
    }
    //"G"
    if ([celltext  isEqual: @"Grilltelt"]) {
        [self performSegueWithIdentifier:@"Grilltelt" sender:self];
    }
    //"I"
    if ([celltext  isEqual: @"Irish Pub"]) {
        [self performSegueWithIdentifier:@"Irish" sender:self];
    }
    //"K"
    if ([celltext  isEqual: @"Kupeen"]) {
        [self performSegueWithIdentifier:@"Kupeen" sender:self];
    }
    //"L"
    if ([celltext  isEqual: @"Lounge med Bar"]) {
        [self performSegueWithIdentifier:@"Lounge" sender:self];
    }
    //"M"
    if ([celltext  isEqual: @"Madbod"]) {
        [self performSegueWithIdentifier:@"Madbod" sender:self];
    }
    if ([celltext  isEqual: @"Marie Laveau"]) {
        [self performSegueWithIdentifier:@"Marie" sender:self];
    }
    if ([celltext  isEqual: @"Mormors Køkken"]) {
        [self performSegueWithIdentifier:@"Mormors" sender:self];
    }
    //"N"
    if ([celltext  isEqual: @"Nolabar"]) {
        [self performSegueWithIdentifier:@"Nolabar" sender:self];
    }
    //"P"
    if ([celltext  isEqual: @"Pandekager/Fastfood"]) {
        [self performSegueWithIdentifier:@"Pandekager" sender:self];
    }
    if ([celltext  isEqual: @"Pølesvogn"]) {
        [self performSegueWithIdentifier:@"Pølesvogn" sender:self];
    }
    //"R"
    if ([celltext  isEqual: @"Rom og Cigarbar"]) {
        [self performSegueWithIdentifier:@"Rom" sender:self];
    }
    //"S"
    if ([celltext  isEqual: @"Sandwichbar"]) {
        [self performSegueWithIdentifier:@"Sandwichbar" sender:self];
    }
    if ([celltext  isEqual: @"Schackenborg"]) {
        [self performSegueWithIdentifier:@"Schackenborg" sender:self];
    }
    if ([celltext  isEqual: @"SOS-bar"]) {
        [self performSegueWithIdentifier:@"SOS" sender:self];
    }
    if ([celltext  isEqual: @"Spisestue med Bar"]) {
        [self performSegueWithIdentifier:@"Spisestue" sender:self];
    }
    if ([celltext  isEqual: @"Steakhouse med lounge"]) {
        [self performSegueWithIdentifier:@"Steak" sender:self];
    }
    //"V"
    if ([celltext  isEqual: @"Vadehavstapas"]) {
        [self performSegueWithIdentifier:@"Vadehav" sender:self];
    }
    if ([celltext  isEqual: @"Vaffelbod"]) {
        [self performSegueWithIdentifier:@"Vaffel" sender:self];
    }
    if ([celltext  isEqual: @"Vinotek"]) {
        [self performSegueWithIdentifier:@"Vinotek" sender:self];
    }
    //"W"
    if ([celltext  isEqual: @"Wok"]) {
        [self performSegueWithIdentifier:@"Wok" sender:self];
    }
    //"Ø"
    if ([celltext  isEqual: @"Øko-bod"]) {
        [self performSegueWithIdentifier:@"Øko" sender:self];
    }
    if ([celltext  isEqual: @"Ølbar"]) {
        [self performSegueWithIdentifier:@"Ølbar" sender:self];
    }
    

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
