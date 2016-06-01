//
//  NSDate+THVDateAdditions.h
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (THVDateAdditions)

+ (NSDateFormatter *)thv_formatterForDateWithoutTime;

- (NSDate *)thv_dateWithoutTime;

@end
