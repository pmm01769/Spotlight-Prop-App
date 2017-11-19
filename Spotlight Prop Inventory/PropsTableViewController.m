//
//  PropsTableViewController.m
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/24/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import "PropsTableViewController.h"
#import "PropsViewController.h"


@interface PropsTableViewController ()

@end

@implementation PropsTableViewController
NSArray *props;
AppDelegate *appDelegate;
NSManagedObjectContext *context;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//props = @[@"Moe", @"Larry", @"Curly"];
    [self loadDataFromDatabase];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [props count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PropCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Props *prop = [props objectAtIndex:[indexPath row]];

    cell.textLabel.text = [prop propName];
    cell.detailTextLabel.text = [prop location];
    cell.imageView.image = [UIImage imageNamed:[prop path]];
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
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   
    if([segue.identifier isEqualToString:@"ViewProps"]){
        PropsViewController *propController = segue.destinationViewController;
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        Props *selectedProp = [props objectAtIndex:[selectedPath row]];
        propController.prop = selectedProp;
    }
    
}
- (void) loadDataFromDatabase {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appDelegate.persistentContainer.viewContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Props" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    NSError *error;
props = [[NSArray alloc]initWithArray:[context executeFetchRequest:request error:&error]];
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Props *propToDelete = [props objectAtIndex:[indexPath row]];
        [context deleteObject:propToDelete];
        NSError *error;
        [context save:&error];
        [self loadDataFromDatabase];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDataFromDatabase];
    [self.tableView reloadData];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation



@end
