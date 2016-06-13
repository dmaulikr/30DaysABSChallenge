//
//  Commons.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const THVReminderTimeFormat;
extern NSString *const THVChallengeDayDateFormat;

extern NSString *const THVMarkAsCompletedNotificationName;
extern NSString *const THVDidReceiveLocalNotifNotificationName;

extern CGFloat const THVCompletedColorR;
extern CGFloat const THVCompletedColorG;
extern CGFloat const THVCompletedColorB;
extern CGFloat const THVCompletedColorA;
extern CGFloat const THVDelayedColorR;
extern CGFloat const THVDelayedColorG;
extern CGFloat const THVDelayedColorB;
extern CGFloat const THVDelayedColorA;
extern CGFloat const THVPendingColorR;
extern CGFloat const THVPendingColorG;
extern CGFloat const THVPendingColorB;
extern CGFloat const THVPendingColorA;

@interface Commons : NSObject

+ (NSDateFormatter *)challengeDayDateFormatter;
+ (NSDateFormatter *)challengeTimeReminderFormatter;
+ (NSNumberFormatter *)challengeAttemptStateNumberFormatter;

@end
