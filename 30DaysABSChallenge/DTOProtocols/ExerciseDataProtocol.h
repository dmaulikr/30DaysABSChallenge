//
//  ExerciseDataProtocol.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExerciseDataProtocol <NSObject>

@required
- (NSNumber *)exerciseAmount;
- (NSString *)exerciseName;
- (NSNumber *)exerciseType;

@optional
- (BOOL)exerciseIsCompleted;
- (NSDate *)exerciseCompletionDate;

@end
