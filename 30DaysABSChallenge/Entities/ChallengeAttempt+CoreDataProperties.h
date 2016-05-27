//
//  ChallengeAttempt+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChallengeAttempt.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeAttempt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *currentDay;
@property (nullable, nonatomic, retain) NSNumber *challengeAttemptId;
@property (nullable, nonatomic, retain) NSNumber *reminderActive;
@property (nullable, nonatomic, retain) NSString *reminderTime;
@property (nullable, nonatomic, retain) NSDate *startDate;
@property (nullable, nonatomic, retain) NSNumber *state;
@property (nullable, nonatomic, retain) Challenge *challenge;
@property (nullable, nonatomic, retain) NSOrderedSet<ChallengeDayAttempt *> *challengeDayAttemptsList;

@end

@interface ChallengeAttempt (CoreDataGeneratedAccessors)

- (void)insertObject:(ChallengeDayAttempt *)value inChallengeDayAttemptsListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChallengeDayAttemptsListAtIndex:(NSUInteger)idx;
- (void)insertChallengeDayAttemptsList:(NSArray<ChallengeDayAttempt *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChallengeDayAttemptsListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChallengeDayAttemptsListAtIndex:(NSUInteger)idx withObject:(ChallengeDayAttempt *)value;
- (void)replaceChallengeDayAttemptsListAtIndexes:(NSIndexSet *)indexes withChallengeDayAttemptsList:(NSArray<ChallengeDayAttempt *> *)values;
- (void)addChallengeDayAttemptsListObject:(ChallengeDayAttempt *)value;
- (void)removeChallengeDayAttemptsListObject:(ChallengeDayAttempt *)value;
- (void)addChallengeDayAttemptsList:(NSOrderedSet<ChallengeDayAttempt *> *)values;
- (void)removeChallengeDayAttemptsList:(NSOrderedSet<ChallengeDayAttempt *> *)values;

@end

NS_ASSUME_NONNULL_END
