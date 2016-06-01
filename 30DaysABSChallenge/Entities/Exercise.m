//
//  Exercise.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

#pragma mark - ExerciseDataProtocol methods
- (NSNumber *)exerciseAmount {
	return [self amount];
}

- (NSString *)exerciseName {
	return [self name];
}

- (NSNumber *)exerciseType {
	return [self type];
}

@end
