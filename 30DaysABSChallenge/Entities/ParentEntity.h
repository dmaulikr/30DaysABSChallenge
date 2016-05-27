//
//  ParentEntity.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParentEntity : NSManagedObject

+ (NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "ParentEntity+CoreDataProperties.h"
