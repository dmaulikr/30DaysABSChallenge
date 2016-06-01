//
//  ChallengeDayAttempt+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChallengeDayAttempt.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeDayAttempt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *challengeDayAttemptDate;
@property (nullable, nonatomic, retain) NSNumber *challengeDayAttemptId;
@property (nullable, nonatomic, retain) NSNumber *completed;
@property (nullable, nonatomic, retain) NSDate *completionDate;
@property (nullable, nonatomic, retain) ChallengeDay *challengeDay;
@property (nullable, nonatomic, retain) ChallengeAttempt *challengeAttempt;
@property (nullable, nonatomic, retain) NSOrderedSet<NSManagedObject *> *exerciseAttemptsList;

@end

@interface ChallengeDayAttempt (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inExerciseAttemptsListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExerciseAttemptsListAtIndex:(NSUInteger)idx;
- (void)insertExerciseAttemptsList:(NSArray<NSManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExerciseAttemptsListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExerciseAttemptsListAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceExerciseAttemptsListAtIndexes:(NSIndexSet *)indexes withExerciseAttemptsList:(NSArray<NSManagedObject *> *)values;
- (void)addExerciseAttemptsListObject:(NSManagedObject *)value;
- (void)removeExerciseAttemptsListObject:(NSManagedObject *)value;
- (void)addExerciseAttemptsList:(NSOrderedSet<NSManagedObject *> *)values;
- (void)removeExerciseAttemptsList:(NSOrderedSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
