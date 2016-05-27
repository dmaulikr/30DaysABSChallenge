//
//  ChallengeDayAttempt+CoreDataProperties.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChallengeDayAttempt.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeDayAttempt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *challengeDayAttemptDate;
@property (nullable, nonatomic, retain) NSNumber *completed;
@property (nullable, nonatomic, retain) NSDate *completionDate;
@property (nullable, nonatomic, retain) NSNumber *challengeDayAttemptId;
@property (nullable, nonatomic, retain) ChallengeDay *challengeDay;

@end

NS_ASSUME_NONNULL_END
