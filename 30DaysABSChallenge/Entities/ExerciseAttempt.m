//
//  ExerciseAttempt.m
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ExerciseAttempt.h"
#import "Exercise.h"
#import "ChallengeDayAttempt.h"

@implementation ExerciseAttempt

#pragma mark - ExerciseDataProtocol methods
- (NSNumber *)exerciseAmount {
	return [[self exercise] amount];
}

- (NSString *)exerciseName {
	return [[self exercise] name];
}

- (NSNumber *)exerciseType {
	return [[self exercise] type];
}

- (BOOL)exerciseIsCompleted {
	return [[self completed] boolValue];
}

- (NSDate *)exerciseCompletionDate {
	return [self completionDate];
}

@end
