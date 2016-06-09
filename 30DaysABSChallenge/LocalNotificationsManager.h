//
//  LocalNotificationsManager.h
//  30DaysABSChallenge
//
//  Created by KRKT on 07/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const THVNotificationActionMarkAsCompleted;
extern NSString *const THVNotificationActionShow;

extern NSString *const THVNotificationCategoryAlert;

extern NSString *const THVNotificationUserInfoChallengeAttemptURIRepresentationId;
extern NSString *const THVNotificationUserInfoChallengeDayAttemptURIRepresentationId;

@interface LocalNotificationsManager : NSObject

+ (instancetype)sharedInstance;

- (void)registerUserInteractionTypesAndCategoriesAndActionableNotificationTypes;
- (void)scheduleNotificationWithChallengeAttemptURI:(NSURL *)challengeUri challengeDayAttemptURI:(NSURL *)dayUri alertDateTime:(NSDate *)alertDateTime challengeName:(NSString *)challengeName dayType:(NSString *)dayType;
- (void)cancelScheduledNotificationForChallengeAttemptURI:(NSURL *)challengeUri;
- (void)renumerateBadgeNumbersForPendingNotifications;

@end
