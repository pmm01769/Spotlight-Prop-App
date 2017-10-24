//
//  FirstViewController.h
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/19/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtProp;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segViewEdit;
-(IBAction)backgroundTap:(id)sender;

@end

