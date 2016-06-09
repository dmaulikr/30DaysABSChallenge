//
//  ChallengeDataProtocol.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChallengeDayDataProtocol.h"

@protocol ChallengeDataProtocol <NSObject>

@required
- (NSString *)challengeName;
- (NSNumber *)numberOfDaysInChallenge;
- (NSArray <ChallengeDayDataProtocol> *)daysListOfChallenge;

@optional
- (NSNumber *)currentDayNumber;
- (BOOL)isCompleted;
- (NSDate *)challengeStartDate;
- (BOOL)isReminderActive;
- (NSString *)challengeReminderTime;
- (BOOL)isDelayed;
- (BOOL)isChallengeDayPendingCompletion;

@end
