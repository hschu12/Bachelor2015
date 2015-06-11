//
//  KunstnerTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 16/04/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "KunstnerTableViewController.h"

@interface KunstnerTableViewController () {
    NSDictionary *spilletider;
    NSDictionary *scene;
    NSArray *spilletiderSections;
}
@end

@implementation KunstnerTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];

    
    spilletider = @{@"A" : @[@"Adam Holmes and The Embers (SCO)", @"Allan Taylor (UK)"],
                    @"B" : @[@"Band Battle New Orleans Style (USA, DK)", @"Bellowhead (ENG)"],
                    @"C" : @[@"Chris Smither (USA)"],
                    @"D" : @[@"Danú (IRL)", @"Dreamers’ Circus & The Danish String Quartet (DK, S)"],
                    @"E" : @[@"Eleanor Shanley (IRL)"],
                    @"F" : @[@"Fanø/Cape Breton Night (DK, CAN)", @"Fara (SCO)", @"folkBALTICA Ensemble (DK, D)",
                             @"Folkeklubben (DK)", @"FolkSpot"],
                    @"G" : @[@"Greg Russell og Ciaran Algar (UK)"],
                    @"H" : @[@"Hans Theessink (NL)", @"Hayseed Dixie (USA)", @"Helene Blum & Harald Haugaard Band (DK)",
                             @"Hot Rize (USA)"],
                    @"J" : @[@"Jacob Dinesen (DK)", @"John Prine (USA)", @"Jonah Blacksmith (DK)"],
                    @"K" : @[@"Kathryn Tickell & The Side (UK)", @"Kepa Junkera (E)", @"King James & The Special Men (USA)"],
                    @"L" : @[@"La Bottine Souriante (CAN)", @"Lynn Miles (CAN)"],
                    @"M" : @[@"Maja & David (DK/CAN)", @"Mames Babegenush (DK)", @"Mànran (SCO)",
                             @"Mary Gauthier (USA)", @"Meschiya Lake & The Little Big Horns (USA)",
                             @"Mike Andersen (DK)"],
                    @"N" : @[@"Niels Hausgaard med gæster (DK)"],
                    @"P" : @[@"Poul Krebs & venner (DK, N, S)"],
                    @"R" : @[@"Richard J. Dobson (USA)", @"Richard Thompson (UK)", @"ROD (DK)", @"Ron Kavana (IRL)", @"Rura (SCO)"],
                    @"S" : @[@"Sheesham, Lotus & ‘Son (CAN)", @"Skerryvore (SCO)", @"Spiro (UK)",
                             @"Sturgill Simpson (USA)"],
                    @"T" : @[@"Ten Strings And A Goat Skin (CAN)", @"The Barra MacNeils (CAN)", @"The Bros Landreth (CAN)",
                             @"The East Pointers (CAN)", @"The Great Malarkey (UK)", @"The Hot Seats (USA)",
                             @"The Lone Bellow (USA)", @"The Sexican (DK)", @"The Stray Birds (USA)",
                             @"The Wailin’ Jennys (CAN)", @"The Wood Brothers (USA)", @"Three Tall Pines (USA)",
                             @"Townes Van Zandt Tribute (NL, USA)"],
                    @"U" : @[@"Usher’s Island (IRL)"]
                    };
                    
                    
                    
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
    //"A"
    if ([celltext  isEqual: @"Adam Holmes and The Embers (SCO)"]) {
        [self performSegueWithIdentifier:@"Adam Holmes" sender:self];
    }
    if ([celltext  isEqual: @"Allan Taylor (UK)"]) {
        [self performSegueWithIdentifier:@"Allan Taylor" sender:self];
    }
    //"B"
    if ([celltext  isEqual: @"Band Battle New Orleans Style (USA, DK)"]) {
        [self performSegueWithIdentifier:@"Band Battle New Orleans Style" sender:self];
    }
    if ([celltext  isEqual: @"Bellowhead (ENG)"]) {
        [self performSegueWithIdentifier:@"Bellowhead" sender:self];
    }
    //"C"
    if ([celltext  isEqual: @"Chris Smither (USA)"]) {
        [self performSegueWithIdentifier:@"Chris Smither" sender:self];
    }
    //"D"
    if ([celltext  isEqual: @"Danú (IRL)"]) {
        [self performSegueWithIdentifier:@"Danu" sender:self];
    }
    if ([celltext  isEqual: @"Dreamers’ Circus & The Danish String Quartet (DK, S)"]) {
        [self performSegueWithIdentifier:@"Dream" sender:self];
    }
    //"E"
    if ([celltext  isEqual: @"Eleanor Shanley (IRL)"]) {
        [self performSegueWithIdentifier:@"Eleanor Shanley" sender:self];
    }
    //"F"
    if ([celltext  isEqual: @"Fanø/Cape Breton Night (DK, CAN)"]) {
        [self performSegueWithIdentifier:@"Fanø" sender:self];
    }
    if ([celltext  isEqual: @"Fara (SCO)"]) {
        [self performSegueWithIdentifier:@"Fara" sender:self];
    }
    if ([celltext  isEqual: @"folkBALTICA Ensemble (DK, D)"]) {
        [self performSegueWithIdentifier:@"folkBALTICA" sender:self];
    }
    if ([celltext  isEqual: @"Folkeklubben (DK)"]) {
        [self performSegueWithIdentifier:@"Folkeklubben" sender:self];
    }
    if ([celltext  isEqual: @"FolkSpot"]) {
        [self performSegueWithIdentifier:@"FolkSpot" sender:self];
    }
    //"G"
    if ([celltext  isEqual: @"Greg Russell og Ciaran Algar (UK)"]) {
        [self performSegueWithIdentifier:@"Greg" sender:self];
    }
    //"H"
    if ([celltext  isEqual: @"Hans Theessink (NL)"]) {
        [self performSegueWithIdentifier:@"Hans" sender:self];
    }
    if ([celltext  isEqual: @"Hayseed Dixie (USA)"]) {
        [self performSegueWithIdentifier:@"Hayseed" sender:self];
    }
    if ([celltext  isEqual: @"Helene Blum & Harald Haugaard Band (DK)"]) {
        [self performSegueWithIdentifier:@"Helene" sender:self];
    }
    if ([celltext  isEqual: @"Hot Rize (USA)"]) {
        [self performSegueWithIdentifier:@"Hot" sender:self];
    }
    //"J"
    if ([celltext  isEqual: @"Jacob Dinesen (DK)"]) {
        [self performSegueWithIdentifier:@"Jacob" sender:self];
    }
    if ([celltext  isEqual: @"John Prine (USA)"]) {
        [self performSegueWithIdentifier:@"John" sender:self];
    }
    if ([celltext  isEqual: @"Jonah Blacksmith (DK)"]) {
        [self performSegueWithIdentifier:@"Jonah" sender:self];
    }
    //"J"
    if ([celltext  isEqual: @"Jacob Dinesen (DK)"]) {
        [self performSegueWithIdentifier:@"Jacob" sender:self];
    }
    if ([celltext  isEqual: @"John Prine (USA)"]) {
        [self performSegueWithIdentifier:@"John" sender:self];
    }
    if ([celltext  isEqual: @"Jonah Blacksmith (DK)"]) {
        [self performSegueWithIdentifier:@"Jonah" sender:self];
    }
    //"K"
    if ([celltext  isEqual: @"Kathryn Tickell & The Side (UK)"]) {
        [self performSegueWithIdentifier:@"Kathryn" sender:self];
    }
    if ([celltext  isEqual: @"Kepa Junkera (E)"]) {
        [self performSegueWithIdentifier:@"Kepa" sender:self];
    }
    if ([celltext  isEqual: @"King James & The Special Men (USA)"]) {
        [self performSegueWithIdentifier:@"King" sender:self];
    }
    //"L"
    if ([celltext  isEqual: @"La Bottine Souriante (CAN)"]) {
        [self performSegueWithIdentifier:@"La" sender:self];
    }
    if ([celltext  isEqual: @"Lynn Miles (CAN)"]) {
        [self performSegueWithIdentifier:@"Lynn" sender:self];
    }
    //"M"
    if ([celltext  isEqual: @"Maja & David (DK/CAN)"]) {
        [self performSegueWithIdentifier:@"Maja" sender:self];
    }
    if ([celltext  isEqual: @"Mames Babegenush (DK)"]) {
        [self performSegueWithIdentifier:@"Mames" sender:self];
    }
    if ([celltext  isEqual: @"Mànran (SCO)"]) {
        [self performSegueWithIdentifier:@"Man" sender:self];
    }
    if ([celltext  isEqual: @"Mary Gauthier (USA)"]) {
        [self performSegueWithIdentifier:@"Mary" sender:self];
    }
    if ([celltext  isEqual: @"Meschiya Lake & The Little Big Horns (USA)"]) {
        [self performSegueWithIdentifier:@"Lake" sender:self];
    }
    if ([celltext  isEqual: @"Mike Andersen (DK)"]) {
        [self performSegueWithIdentifier:@"Mike" sender:self];
    }
    //"N"
    if ([celltext  isEqual: @"Niels Hausgaard med gæster (DK)"]) {
        [self performSegueWithIdentifier:@"Niels" sender:self];
    }
    //"P"
    if ([celltext  isEqual: @"Poul Krebs & venner (DK, N, S)"]) {
        [self performSegueWithIdentifier:@"Poul" sender:self];
    }
    //"R"
    if ([celltext  isEqual: @"Richard J. Dobson (USA)"]) {
        [self performSegueWithIdentifier:@"RichardJ" sender:self];
    }
    if ([celltext  isEqual: @"Richard Thompson (UK)"]) {
        [self performSegueWithIdentifier:@"RichardT" sender:self];
    }
    if ([celltext  isEqual: @"ROD (DK)"]) {
        [self performSegueWithIdentifier:@"Rod" sender:self];
    }
    if ([celltext  isEqual: @"Ron Kavana (IRL)"]) {
        [self performSegueWithIdentifier:@"Ron" sender:self];
    }
    if ([celltext  isEqual: @"Rura (SCO)"]) {
        [self performSegueWithIdentifier:@"Rura" sender:self];
    }
    //"S"
    if ([celltext  isEqual: @"Sheesham, Lotus & ‘Son (CAN)"]) {
        [self performSegueWithIdentifier:@"Lotus" sender:self];
    }
    if ([celltext  isEqual: @"Skerryvore (SCO)"]) {
        [self performSegueWithIdentifier:@"Skerry" sender:self];
    }
    if ([celltext  isEqual: @"Spiro (UK)"]) {
        [self performSegueWithIdentifier:@"Spiro" sender:self];
    }
    if ([celltext  isEqual: @"Sturgill Simpson (USA)"]) {
        [self performSegueWithIdentifier:@"Sturgill" sender:self];
    }
    //"T"
    if ([celltext  isEqual: @"Ten Strings And A Goat Skin (CAN)"]) {
        [self performSegueWithIdentifier:@"Ten" sender:self];
    }
    if ([celltext  isEqual: @"The Barra MacNeils (CAN)"]) {
        [self performSegueWithIdentifier:@"Barra" sender:self];
    }
    if ([celltext  isEqual: @"The Bros Landreth (CAN)"]) {
        [self performSegueWithIdentifier:@"Bros" sender:self];
    }
    if ([celltext  isEqual: @"The East Pointers (CAN)"]) {
        [self performSegueWithIdentifier:@"East" sender:self];
    }
    if ([celltext  isEqual: @"The Great Malarkey (UK)"]) {
        [self performSegueWithIdentifier:@"Malarkey" sender:self];
    }
    if ([celltext  isEqual: @"The Hot Seats (USA)"]) {
        [self performSegueWithIdentifier:@"Seats" sender:self];
    }
    if ([celltext  isEqual: @"The Lone Bellow (USA)"]) {
        [self performSegueWithIdentifier:@"Lone" sender:self];
    }
    if ([celltext  isEqual: @"The Sexican (DK)"]) {
        [self performSegueWithIdentifier:@"Sexican" sender:self];
    }
    if ([celltext  isEqual: @"The Stray Birds (USA)"]) {
        [self performSegueWithIdentifier:@"Stray" sender:self];
    }
    if ([celltext  isEqual: @"The Wailin’ Jennys (CAN)"]) {
        [self performSegueWithIdentifier:@"Jennys" sender:self];
    }
    if ([celltext  isEqual: @"The Wood Brothers (USA)"]) {
        [self performSegueWithIdentifier:@"Wood" sender:self];
    }
    if ([celltext  isEqual: @"Three Tall Pines (USA)"]) {
        [self performSegueWithIdentifier:@"Three" sender:self];
    }
    if ([celltext  isEqual: @"Townes Van Zandt Tribute (NL, USA)"]) {
        [self performSegueWithIdentifier:@"Townes" sender:self];
    }
    //"U"
    if ([celltext  isEqual: @"Usher’s Island (IRL)"]) {
        [self performSegueWithIdentifier:@"Usher" sender:self];
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
 if ([[segue identifier] isEqualToString:@"Pokey"]) {
 //preparation
 } else if ([[segue identifier] isEqualToString:@"Hudson"]) {
 //other preparation
 }
 }

@end
