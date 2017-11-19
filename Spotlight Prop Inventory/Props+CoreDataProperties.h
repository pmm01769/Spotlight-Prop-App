//
//  Props+CoreDataProperties.h
//  Spotlight Prop Inventory
//
//  Created by Philip Mante on 10/26/17.
//  Copyright © 2017 Mante, Philip M. All rights reserved.
//
//

#import "Props+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Props (CoreDataProperties)

+ (NSFetchRequest<Props *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *location;
@property (nullable, nonatomic, copy) NSString *propName;
@property (nullable, nonatomic, copy) NSString *path;
@end

NS_ASSUME_NONNULL_END
