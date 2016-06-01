//
//  ExerciseAttempt.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentEntity.h"
#import "ExerciseDataProtocol.h"

@class Exercise, ChallengeDayAttempt;

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseAttempt : ParentEntity <ExerciseDataProtocol>

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "ExerciseAttempt+CoreDataProperties.h"
