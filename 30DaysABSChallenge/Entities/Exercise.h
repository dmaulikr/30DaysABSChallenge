//
//  Exercise.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentEntity.h"

typedef enum {
	THVExerciseTypeRepetition	= 1,
	THVExerciseTypeTime			= 2
} THVExerciseType;

NS_ASSUME_NONNULL_BEGIN

@interface Exercise : ParentEntity

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Exercise+CoreDataProperties.h"
