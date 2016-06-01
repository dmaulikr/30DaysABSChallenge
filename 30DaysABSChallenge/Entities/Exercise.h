//
//  Exercise.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentEntity.h"
#import "ExerciseDataProtocol.h"

typedef enum {
	THVExerciseTypeRepetition	= 1,
	THVExerciseTypeTime			= 2,
	THVExerciseTypeToDo			= 3
} THVExerciseType;

@class ChallengeDay, ExerciseAttempt;

NS_ASSUME_NONNULL_BEGIN

@interface Exercise : ParentEntity <ExerciseDataProtocol>

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Exercise+CoreDataProperties.h"
