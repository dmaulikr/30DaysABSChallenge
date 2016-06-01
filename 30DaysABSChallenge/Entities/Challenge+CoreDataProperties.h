//
//  Challenge+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Challenge.h"

NS_ASSUME_NONNULL_BEGIN

@interface Challenge (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *challengeId;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *numberOfDays;
@property (nullable, nonatomic, retain) NSOrderedSet<ChallengeDay *> *daysList;
@property (nullable, nonatomic, retain) NSOrderedSet<ChallengeAttempt *> *challengeAttemptsList;

@end

@interface Challenge (CoreDataGeneratedAccessors)

- (void)insertObject:(ChallengeDay *)value inDaysListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDaysListAtIndex:(NSUInteger)idx;
- (void)insertDaysList:(NSArray<ChallengeDay *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDaysListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDaysListAtIndex:(NSUInteger)idx withObject:(ChallengeDay *)value;
- (void)replaceDaysListAtIndexes:(NSIndexSet *)indexes withDaysList:(NSArray<ChallengeDay *> *)values;
- (void)addDaysListObject:(ChallengeDay *)value;
- (void)removeDaysListObject:(ChallengeDay *)value;
- (void)addDaysList:(NSOrderedSet<ChallengeDay *> *)values;
- (void)removeDaysList:(NSOrderedSet<ChallengeDay *> *)values;

- (void)insertObject:(ChallengeAttempt *)value inChallengeAttemptsListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChallengeAttemptsListAtIndex:(NSUInteger)idx;
- (void)insertChallengeAttemptsList:(NSArray<ChallengeAttempt *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChallengeAttemptsListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChallengeAttemptsListAtIndex:(NSUInteger)idx withObject:(ChallengeAttempt *)value;
- (void)replaceChallengeAttemptsListAtIndexes:(NSIndexSet *)indexes withChallengeAttemptsList:(NSArray<ChallengeAttempt *> *)values;
- (void)addChallengeAttemptsListObject:(ChallengeAttempt *)value;
- (void)removeChallengeAttemptsListObject:(ChallengeAttempt *)value;
- (void)addChallengeAttemptsList:(NSOrderedSet<ChallengeAttempt *> *)values;
- (void)removeChallengeAttemptsList:(NSOrderedSet<ChallengeAttempt *> *)values;

@end

NS_ASSUME_NONNULL_END
