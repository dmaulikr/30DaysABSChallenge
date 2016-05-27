//
//  ChallengeDay+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChallengeDay.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeDay (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *dayNumber;
@property (nullable, nonatomic, retain) NSNumber *challengeDayId;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) NSOrderedSet<Exercise *> *exerciseList;

@end

@interface ChallengeDay (CoreDataGeneratedAccessors)

- (void)insertObject:(Exercise *)value inExerciseListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExerciseListAtIndex:(NSUInteger)idx;
- (void)insertExerciseList:(NSArray<Exercise *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExerciseListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExerciseListAtIndex:(NSUInteger)idx withObject:(Exercise *)value;
- (void)replaceExerciseListAtIndexes:(NSIndexSet *)indexes withExerciseList:(NSArray<Exercise *> *)values;
- (void)addExerciseListObject:(Exercise *)value;
- (void)removeExerciseListObject:(Exercise *)value;
- (void)addExerciseList:(NSOrderedSet<Exercise *> *)values;
- (void)removeExerciseList:(NSOrderedSet<Exercise *> *)values;

@end

NS_ASSUME_NONNULL_END
