//
//  ChallengeDayDataProtocol.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseDataProtocol.h"

@protocol ChallengeDayDataProtocol <NSObject>

@required
- (NSNumber *)challengeDayNumber;
- (NSString *)dayTypeName;
- (NSArray <ExerciseDataProtocol> *)exerciseListOfDay;

@optional
- (NSDate *)dayAttemptDate;
- (BOOL)isCompleted;

@end
