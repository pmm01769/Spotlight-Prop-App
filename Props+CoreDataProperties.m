//
//  Props+CoreDataProperties.m
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/24/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import "Props+CoreDataProperties.h"

@implementation Props (CoreDataProperties)

+ (NSFetchRequest<Props *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Props"];
}

@dynamic propName;
@dynamic location;

@end
