//
//  Challenge.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "Challenge.h"
#import "ChallengeDay.h"

@implementation Challenge

#pragma mark - ChallengeDataProtocol methods
- (NSString *)challengeName {
	return [self name];
}

- (NSNumber *)numberOfDaysInChallenge {
	return [self numberOfDays];
}

- (NSArray <ChallengeDayDataProtocol> *)daysListOfChallenge {
	return (NSArray <ChallengeDayDataProtocol> *)[[self daysList] array];
}


@end
