//
//  FirstViewController.m
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/19/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//pmm01769@bitbucket.org:Arthrougs/spotlight-prop-inventory.git

#import "PropsViewController.h"
#import "Props+CoreDataClass.h"
#import "AppDelegate.h"

@interface PropsViewController ()

@end

@implementation PropsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
if (_prop)
{
    _txtProp.text = _prop.propName;
    _txtLocation.text = _prop.location;
    _txtImage.text = _prop.path;
    
    
}
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editToggled:(id)sender { if (_segViewEdit.selectedSegmentIndex == 1)
{
    _txtProp.enabled =true;
    _txtLocation.enabled = true;
    _txtImage.enabled = true;
    
    
}
   else
   {
       _txtProp.enabled = false;
       _txtLocation.enabled = false;
       _txtImage.enabled = false;
   }
    
}

- (IBAction)backgroundTap:(id)sender{
    [self.view endEditing:YES];
}
- (IBAction)saveProp:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  //  Props *prop = [NSEntityDescription insertNewObjectForEntityForName:@"Props" inManagedObjectContext:context];
    NSError *error;
    if (!_prop)
    {
        
        _prop = [NSEntityDescription insertNewObjectForEntityForName:@"Props" inManagedObjectContext:context];
        
        
    }
    [_prop setValue:_txtProp.text forKey:@"propName"];
    [_prop setValue:_txtLocation.text forKey:@"location"];
    [_prop setValue:_txtImage.text forKey:@"path"];
    
    
    [context save:&error];
    
    if(error != nil) {
        NSLog(@"Error saving object: %@", error.description);
    }
    else {
        NSLog(@"%@ saved successfully", _txtProp.text);
    }
    
    [_segViewEdit setSelectedSegmentIndex:0];
    
    _txtProp.enabled = false;
    _txtLocation.enabled = false;
    _txtImage.enabled = false;
    
}



@end
