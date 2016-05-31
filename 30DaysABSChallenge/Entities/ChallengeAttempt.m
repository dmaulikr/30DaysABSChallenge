//
//  ChallengeAttempt.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeAttempt.h"
#import "Challenge.h"
#import "ChallengeDayAttempt.h"

@implementation ChallengeAttempt

#pragma mark - ChallengeDataProtocol methods
- (NSString *)challengeName {
	return [[self challenge] name];
}

- (NSNumber *)numberOfDaysInChallenge {
	return [[self challenge] numberOfDays];
}

- (NSArray <ChallengeDayDataProtocol> *)daysListOfChallenge {
	return (NSArray <ChallengeDayDataProtocol> *)[[self challengeDayAttemptsList] array];
}

- (NSNumber *)currentDayNumber {
	return [self currentDay];
}

- (BOOL)isCompleted {
	return [[self state] integerValue] == THVChallengeAttemptStateCompleted;
}

- (NSDate *)challengeStartDate {
	return [self startDate];
}

@end
