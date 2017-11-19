//
//  Props+CoreDataProperties.m
//  Spotlight Prop Inventory
//
//  Created by Philip Mante on 10/26/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//
//

#import "Props+CoreDataProperties.h"

@implementation Props (CoreDataProperties)

+ (NSFetchRequest<Props *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Props"];
}

@dynamic location;
@dynamic propName;
@dynamic path;

@end
