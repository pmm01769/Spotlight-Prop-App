//
//  Props+CoreDataProperties.h
//  Spotlight Prop Inventory
//
//  Created by Mante, Philip M on 10/24/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//

#import "Props+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Props (CoreDataProperties)

+ (NSFetchRequest<Props *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *propName;
@property (nullable, nonatomic, copy) NSString *location;

@end

NS_ASSUME_NONNULL_END
