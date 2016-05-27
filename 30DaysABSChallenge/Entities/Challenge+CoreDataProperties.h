//
//  Challenge+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
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

@end

NS_ASSUME_NONNULL_END
