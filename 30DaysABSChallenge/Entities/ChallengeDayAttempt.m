//
//  ChallengeDayAttempt.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDayAttempt.h"
#import "ChallengeDay.h"

@implementation ChallengeDayAttempt

#pragma mark - ChallengeDayDataProtocol methods
- (NSNumber *)challengeDayNumber {
	return [[self challengeDay] dayNumber];
}

- (NSString *)dayTypeName {
	return [[[self challengeDay] type] integerValue] == THVChallengeDayTypeWorkout ? @"Workout" : @"Rest";
}

- (NSArray <ExerciseDataProtocol> *)exerciseListOfDay {
	return (NSArray <ExerciseDataProtocol> *)[[self exerciseAttemptsList] array];
}

- (NSDate *)dayAttemptDate {
	return [self challengeDayAttemptDate];
}

- (BOOL)isCompleted {
	return [[self completed] boolValue];
}

@end
