//
//  SecondViewController.m
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/19/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//
//Test comment
//i need lunch
#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editToggled:(id)sender { if (_segViewEdit.selectedSegmentIndex == 1)
{
    
    _txtLocation.enabled = true;
    
    
    
}
else
{
  
    _txtLocation.enabled = false;
    
}
    
}


@end
