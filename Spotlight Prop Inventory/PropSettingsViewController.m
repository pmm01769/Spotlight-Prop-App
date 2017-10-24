//
//  PropSettingsViewController.m
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/24/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import "PropSettingsViewController.h"

@interface PropSettingsViewController ()

@end

@implementation PropSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    bool sortAscending = [settings boolForKey:@"sortDirectionAscending"];
    [_swAscending setOn:sortAscending];
}

- (IBAction)sortDirectionChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:_swAscending.isOn forKey:@"sortDirectionAscending"];
    [defaults synchronize];
}

@end
