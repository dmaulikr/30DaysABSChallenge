//
//  ChallengeDayAttempt.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentEntity.h"
#import "ChallengeDayDataProtocol.h"

@class ChallengeDay, ChallengeAttempt;

NS_ASSUME_NONNULL_BEGIN

@interface ChallengeDayAttempt : ParentEntity <ChallengeDayDataProtocol>

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "ChallengeDayAttempt+CoreDataProperties.h"
