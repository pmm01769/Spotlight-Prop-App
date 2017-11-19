//
//  AppDelegate.h
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/19/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

