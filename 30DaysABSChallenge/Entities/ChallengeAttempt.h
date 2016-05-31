//
//  ChallengeAttempt.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentEntity.h"
#import "ChallengeDataProtocol.h"

typedef enum {
	THVChallengeAttemptStateActive		= 1,
	THVChallengeAttemptStateCompleted	= 2
} THVChallengeAttemptState;

@class Challenge, ChallengeDayAttempt;

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeAttempt : ParentEntity <ChallengeDataProtocol>

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "ChallengeAttempt+CoreDataProperties.h"
