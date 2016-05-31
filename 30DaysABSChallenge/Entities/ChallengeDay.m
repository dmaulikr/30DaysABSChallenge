//
//  ChallengeDay.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDay.h"
#import "Exercise.h"

@implementation ChallengeDay

#pragma mark - ChallengeDayDataProtocol methods
- (NSNumber *)challengeDayNumber {
	return [self dayNumber];
}

- (NSString *)dayTypeName {
	return [[self type] integerValue] == THVChallengeDayTypeWorkout ? @"Workout" : @"Rest";
}

- (NSArray <Exercise *> *)exerciseListOfDay {
	return [[self exerciseList] array];
}

@end
