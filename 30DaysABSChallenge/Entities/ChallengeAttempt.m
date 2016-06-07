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
#import "NSDate+THVDateAdditions.h"
#import "LocalNotificationsManager.h"

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

- (BOOL)isReminderActive {
	return [[self reminderActive] boolValue];
}

- (NSString *)challengeReminderTime {
	return [self reminderTime];
}

- (ChallengeDayAttempt *)nearestChallengeDayForDate:(NSDate *)date {
	NSDate *dateToCompare = [date thv_dateWithoutTime];
	
	BOOL returnNext = NO;
	
	for (ChallengeDayAttempt *day in [self challengeDayAttemptsList]) {
		if ([day.dayAttemptDate isEqualToDate:dateToCompare]) {
			// TODO: add to ChallengeDayAttempt method that will return reminder date time
			// check if reminder date time is in past, if yes - returnNext = YES and return next dayattempt from array
			
			return day;
		}
	}
	
	return nil;
}

- (void)scheduleNextNotificationForDate:(NSDate *)dateOfNextChallengeDay {
	if (self.reminderActive && self.reminderTime) {
		NSDate *nextAttemptDayDate = dateOfNextChallengeDay.timeIntervalSinceNow < 0 ? [NSDate date] : dateOfNextChallengeDay;
		ChallengeDayAttempt *nextDay = [self nearestChallengeDayForDate:nextAttemptDayDate];
		if (!nextDay) {
			NSLog(@"There are no more days for this challenge");
			[[LocalNotificationsManager sharedInstance] cancelScheduledNotificationForChallengeAttemptURI:[[self objectID] URIRepresentation]];
			return;
		}
		
		NSURL *challengeURI = [[self objectID] URIRepresentation];
		NSURL *dayURI = [[nextDay objectID] URIRepresentation];
		
		[[LocalNotificationsManager sharedInstance] scheduleNotificationWithChallengeAttemptURI:challengeURI challengeDayAttemptURI:dayURI alertDate:nextAttemptDayDate alertTime:self.reminderTime challengeName:[self challengeName] dayType:[nextDay dayTypeName]];
	} else {
		[[LocalNotificationsManager sharedInstance] cancelScheduledNotificationForChallengeAttemptURI:[[self objectID] URIRepresentation]];
	}
}

@end
