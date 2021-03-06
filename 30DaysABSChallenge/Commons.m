//
//  Commons.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "Commons.h"

NSString *const THVReminderTimeFormat = @"HH:mm";
NSString *const THVChallengeDayDateFormat = @"dd MMM";

NSString *const THVMarkAsCompletedNotificationName = @"MARK_AS_COMPLETED_NOTIFICATION";
NSString *const THVDidReceiveLocalNotifNotificationName = @"DID_RECEIVE_LOCAL_NOTIFICATION";

CGFloat const THVCompletedColorR = 95./255.;
CGFloat const THVCompletedColorG = 186./255.;
CGFloat const THVCompletedColorB = 125./255.;
CGFloat const THVCompletedColorA = 1.0;
CGFloat const THVDelayedColorR = 217./255.;
CGFloat const THVDelayedColorG = 87./255.;
CGFloat const THVDelayedColorB = 90./255.;
CGFloat const THVDelayedColorA = 1.0;
CGFloat const THVPendingColorR = 255./255.;
CGFloat const THVPendingColorG = 213./255.;
CGFloat const THVPendingColorB = 74./255.;
CGFloat const THVPendingColorA = 1.0;

@implementation Commons

+ (NSDateFormatter *)challengeDayDateFormatter {
	static NSDateFormatter *dateFormatter;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		dateFormatter = [[NSDateFormatter alloc] init];
		dateFormatter.dateFormat = THVChallengeDayDateFormat;
	});
	
	return dateFormatter;
}

+ (NSDateFormatter *)challengeTimeReminderFormatter {
	static NSDateFormatter *dateFormatter;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		dateFormatter = [[NSDateFormatter alloc] init];
		dateFormatter.dateFormat = THVReminderTimeFormat;
	});
	
	return dateFormatter;
}

+ (NSNumberFormatter *)challengeAttemptStateNumberFormatter {
	static NSNumberFormatter *numberFormatter;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		numberFormatter = [[NSNumberFormatter alloc] init];
		[numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
	});
	return numberFormatter;
}



@end
