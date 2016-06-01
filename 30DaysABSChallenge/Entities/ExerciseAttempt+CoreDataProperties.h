//
//  ExerciseAttempt+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExerciseAttempt.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseAttempt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *completed;
@property (nullable, nonatomic, retain) NSDate *completionDate;
@property (nullable, nonatomic, retain) ChallengeDayAttempt *challengeDayAttempt;
@property (nullable, nonatomic, retain) Exercise *exercise;

@end

NS_ASSUME_NONNULL_END
