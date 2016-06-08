//
//  ChallengeDayAttempt.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDayAttempt.h"
#import "ChallengeDay.h"
#import "Commons.h"
#import "ChallengeAttempt.h"

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

- (NSDate *)reminderDateTime {
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *reminderDateComponents = [calendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:self.dayAttemptDate];
	
	NSDate *reminderFireTime = [[Commons challengeTimeReminderFormatter] dateFromString:self.challengeAttempt.reminderTime];
	NSDateComponents *reminderTimeComponents = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:reminderFireTime];
	reminderTimeComponents.day = reminderDateComponents.day;
	reminderTimeComponents.month = reminderDateComponents.month;
	reminderTimeComponents.year = reminderDateComponents.year;
	
	NSDate *fireDate = [calendar dateFromComponents:reminderTimeComponents];
	
	return fireDate;
}

@end
