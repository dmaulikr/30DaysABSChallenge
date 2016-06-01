//
//  Exercise+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Exercise.h"

NS_ASSUME_NONNULL_BEGIN

@interface Exercise (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) ChallengeDay *challengeDay;
@property (nullable, nonatomic, retain) NSOrderedSet<ExerciseAttempt *> *exerciseAttemptsList;

@end

@interface Exercise (CoreDataGeneratedAccessors)

- (void)insertObject:(ExerciseAttempt *)value inExerciseAttemptsListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExerciseAttemptsListAtIndex:(NSUInteger)idx;
- (void)insertExerciseAttemptsList:(NSArray<ExerciseAttempt *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExerciseAttemptsListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExerciseAttemptsListAtIndex:(NSUInteger)idx withObject:(ExerciseAttempt *)value;
- (void)replaceExerciseAttemptsListAtIndexes:(NSIndexSet *)indexes withExerciseAttemptsList:(NSArray<ExerciseAttempt *> *)values;
- (void)addExerciseAttemptsListObject:(ExerciseAttempt *)value;
- (void)removeExerciseAttemptsListObject:(ExerciseAttempt *)value;
- (void)addExerciseAttemptsList:(NSOrderedSet<ExerciseAttempt *> *)values;
- (void)removeExerciseAttemptsList:(NSOrderedSet<ExerciseAttempt *> *)values;

@end

NS_ASSUME_NONNULL_END
