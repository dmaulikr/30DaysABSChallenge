//
//  LocalNotificationsManager.m
//  30DaysABSChallenge
//
//  Created by KRKT on 07/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "LocalNotificationsManager.h"
#import "Commons.h"
#import "UILocalNotification+THVPrintingAdditions.h"

NSString *const THVNotificationActionMarkAsCompleted = @"MARK_AS_COMPLETED";
NSString *const THVNotificationActionShow = @"SHOW";

NSString *const THVNotificationCategoryAlert = @"ALERT_CATEGORY";

NSString *const THVNotificationUserInfoChallengeAttemptURIRepresentationId = @"challengeAttemptURI";
NSString *const THVNotificationUserInfoChallengeDayAttemptURIRepresentationId = @"challengeDayAttemptURI";

@implementation LocalNotificationsManager

+ (instancetype)sharedInstance {
	static LocalNotificationsManager *sharedManager = nil;
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		sharedManager = [[LocalNotificationsManager alloc] init];
	});
	
	return sharedManager;
}

- (void)registerUserInteractionTypesAndCategoriesAndActionableNotificationTypes {
	UIUserNotificationType types = (UIUserNotificationTypeAlert);
	
	UIMutableUserNotificationAction *markAsCompletedAction = [[UIMutableUserNotificationAction alloc] init];
	markAsCompletedAction.identifier = THVNotificationActionMarkAsCompleted;
	markAsCompletedAction.title = @"Mark as completed";
	markAsCompletedAction.activationMode = UIUserNotificationActivationModeBackground;
	markAsCompletedAction.destructive = YES;
	markAsCompletedAction.authenticationRequired = NO;
	
	UIMutableUserNotificationAction *showAction = [[UIMutableUserNotificationAction alloc] init];
	showAction.identifier = THVNotificationActionShow;
	showAction.title = @"Show";
	showAction.activationMode = UIUserNotificationActivationModeForeground;
	showAction.destructive = NO;
	showAction.authenticationRequired = YES;
	
	UIMutableUserNotificationCategory *alarmCategory = [[UIMutableUserNotificationCategory alloc] init];
	alarmCategory.identifier = THVNotificationCategoryAlert;
	[alarmCategory setActions:@[markAsCompletedAction, showAction] forContext:UIUserNotificationActionContextMinimal];
	[alarmCategory setActions:@[showAction, markAsCompletedAction] forContext:UIUserNotificationActionContextDefault];
	
	NSSet<UIUserNotificationCategory *> *categories = [NSSet setWithObject:alarmCategory];
	
	UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
	
	[[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
}

- (void)scheduleNotificationWithChallengeAttemptURI:(NSURL *)challengeUri challengeDayAttemptURI:(NSURL *)dayUri alertDateTime:(NSDate *)alertDateTime challengeName:(NSString *)challengeName dayType:(NSString *)dayType {
	
	[self cancelScheduledNotificationForChallengeAttemptURI:challengeUri];
	
	UILocalNotification *notification = [[UILocalNotification alloc] init];
	if (notification == nil) {
		return;
	}
	
	notification.fireDate = alertDateTime;
	notification.alertBody = [NSString stringWithFormat:@"%@: %@", challengeName, dayType];
	notification.category = THVNotificationCategoryAlert;
	
	NSDictionary *infoDict = @{
							   THVNotificationUserInfoChallengeAttemptURIRepresentationId : [challengeUri absoluteString],
							   THVNotificationUserInfoChallengeDayAttemptURIRepresentationId : [dayUri absoluteString]
							   };
	notification.userInfo = infoDict;
	
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
//	DEBUG
//	NSLog(@"Added notification: %@", notification.thv_description);
}

- (void)cancelScheduledNotificationForChallengeAttemptURI:(NSURL *)challengeUri {
	for (UILocalNotification *notif in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
		if ([notif.userInfo[THVNotificationUserInfoChallengeAttemptURIRepresentationId] isEqualToString:[challengeUri absoluteString]]) {
//			DEBUG
//			NSLog(@"Removing notification: %@", notif.thv_description);
			[[UIApplication sharedApplication] cancelLocalNotification:notif];
		}
	}
}

@end
