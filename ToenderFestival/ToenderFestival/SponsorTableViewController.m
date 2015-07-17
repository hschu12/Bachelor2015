//
//  SponsorTableViewController.m
//  ToenderFestival
//
//  Created by Henrik Schulz on 17/07/15.
//  Copyright (c) 2015 Henrik Schulz. All rights reserved.
//

#import "SponsorTableViewController.h"

@interface SponsorTableViewController (){
    NSDictionary *spilletider;
    NSArray *spilletiderSections;
}



@end

@implementation SponsorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
    [barButtonAppearance setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:116.0f/255.0f green:141.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    
    
    spilletider = @{@" Storsponsorer" : @[@"A/S Vestfrost", @"Ecco Sko A/S", @"Kvickly", @"Laursen Grafisk A/S", @"Linak A/S", @"Revisionscentret Tønder",
                                          @"Sapa Extrusion Tønder A/S",@"Sapa Precision Tubing Tønder A/S", @"Sydbank", @"Tuborg/Carlsberg Danmark",
                                          @"Tønder Kommune"],
                    @"Mediesponsorer" : @[@"JydskeVestkysten", @"Ugeavisen Tønder"],
                    @" Vinsponsorer" : @[@"Bager Andersen", @"Calle Grenz-Shops Butikker", @"Dansk Vinlager", @"Fakta GmbH Butikker", @"Fleggårds Butikker",
                                         @"Købmandsgårdens Butikker", @"Priss Butikker", @"Schmidt Im- & Export", @"SK Discount Butikker", @"Zentralmarkt"],
                    @"Sponsorer" : @[@"Abena A/S", @"Danske Bank", @"Fa. F. Engel Haderslev (Workzone, Sunwill trousers, Deerhunter jagt- og fritid)",
                                     @"Erhvervsakademi Sydvest", @"Fabrikant Mads Clausens Fond", @"Flemming Jakobsen Kompetenceudvikling",
                                     @"Garuda", @"Kunstmuseet i Tønder", @"Okholm Lighting A/S", @"Okholms Maskinfabrik A/S", @"Restaurant Skibbroen",
                                     @"Tele-Hjørnet/Call me", @"VAGABOND", @"ABR Catering", @"A/S Carl Knudsen Tønder", @"Advokatfirmaet Jan Hansen",
                                     @"Advokatfirmaet Karen Marie og Anders Hansen", @"Agerskov Kro og Hotel", @"Amalie Vinimport A/S", @"Andelskassen Tønder",
                                     @"Bager Lukas", @"Berendsens Textil Service A/S", @"Boi Davidsens Maskinforretning", @"Brdr. Walz ApS", @"Bygma Tønder",
                                     @"Cafax Sydjylland", @"Café Kridt", @"Carl Skoma’r Bar Bodega Billiard", @"Central Halle", @"Chr. Petersen & Søn Eftf. Aps.",
                                     @"Dansk Revision", @"Den Jydske Sparekasse", @"Digeposten", @"EDC Mæglerne Jens Vesterholm", @"El-Centrum",
                                     @"Enjoy Resorts Holding A/S", @"Expert & Punkt 1 Tønder ApS", @"Feriepartner Rømø-Tønder", @"Festshoppen",
                                     @"Garuda", @"Glaskunsten", @"Glenco A/S", @"Guldbageren", @"Hans Iversen", @"Hobby Sy og Strik", @"HÅRDESIGN",
                                     @"Indbo Center", @"Ingeniørerne", @"Intersport", @"Jefsen Bog & Idé", @"Jessen’s Victoria Tønder ApS",
                                     @"Johannes – Gågadens Kaffe & Vin", @"Jyske Bank", @"Kirchheiner El-Teknik ApS", @"Kjelkvist A/S",
                                     @"Klostercaféen", @"Knud Weiland ApS", @"Kong Christian den X.", @"Kreditbanken Tønder", @"Lassen Blomster",
                                     @"LB bilsyn", @"Løgumkloster Lys", @"Matzen byggeforretning Aps", @"Modeforretningerne Lundgård, Zine og Wagner", @"Mr. Hoff",
                                     @"Møbelhuset 1 og 2", @"PN-Farver", @"Praxis-Fonden", @"Pro Rengøring ApS", @"Ravsted Slagteri", @"Schackenborg Slotskro",
                                     @"Skibbrokiosken", @"Skriver A/S", @"Spedition Mylin", @"Sportigan v/ Peter Sørensen og Anders Paulsen", @"Square Oo og Youngsters Oo",
                                     @"SRI Sign Solution A/S", @"Stones", @"Sønderjysk Forsikring", @"TOPS Sandersen ApS", @"Torvets Pølser",
                                     @"Tønder Handelsgymnasium & Handelsskole", @"Tønder Havecenter", @"Tønder Revision og Kloster Revision",
                                     @"Tønder Sparekasse", @"Tønder Sport & FritidsCenter", @"Tønder Tømrer- & Snedkerforetning", @"Vest Biler Syd A/S",
                                     @"Vibholm Tønder", @"Vognmand Henning Klingenberg", @"Win-Door A/S"],
                    @"Støttere" : @[@"SE Vækstpulje", @"Abild El", @"Abtek v. Uffe Nielsen", @"Belø A/S VVS og Gas", @"Bimpel v. Brian Rostgaard Andersen · Bo Michelsen A/S",
                                    @"Border Line Security", @"Brødrene Hartmann A/S", @"Carl Knudsen A/S", @"Creo Arkitekter Syd ApS", @"Dansk ForsikringsMæglerhus",
                                    @"Danske Fragtmænd", @"Deko-Vest Totalreklame", @"Dicentia", @"DP Clean Tech Europe A/S", @"Ejnar Christiansen Sølsted A/S",
                                    @"Entreprenør Knud Lykou", @"EUC-Syd Levnedsmiddelafd. Tønder", @"Europcar", @"Freiberg A/S", @"Holger & Ingemann Petersen",
                                    @"Højer Pølser A/S", @"Jejsing Trælasthandel og bygningssnedkeri ApS", @"Jürgensen VVS ApS", @"Jørgen Sørensen",
                                    @"Kjelkvist", @"Kraftmann", @"Kulturhistorie Tønder/Kunstmuseet i Tønder", @"Lars B. Christensen", @"Lemminkäinen A/S",
                                    @"Lynge Elektro", @"Marius Pedersen A/S", @"PN Farver", @"Primogas", @"Prolt ApS v/Jens Ove Kjær", @"Skaks Specialtransport A/S",
                                    @"Skriver, Tømrer- og Snedkerforretning A/S", @"Stallex A/S", @"Statsfængslet i Renbæk", @"Sæd Autoservice",
                                    @"Sønderjysk landskab og anlægsdesign", @"TDC A/S", @"Telekæden", @"Thykjær A/S", @"Tønder Frivillige Brandværn",
                                    @"Zwanenburg, Øster Højst"],
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
