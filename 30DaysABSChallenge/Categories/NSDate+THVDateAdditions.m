//
//  NSDate+THVDateAdditions.m
//  30DaysABSChallenge
//
//  Created by KRKT on 01/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "NSDate+THVDateAdditions.h"

@implementation NSDate (THVDateAdditions)

+ (NSDateFormatter *)thv_formatterForDateWithoutTime {
	static NSDateFormatter *formatter;
	
	static dispatch_once_t once;
	dispatch_once(&once, ^{
		formatter = [[NSDateFormatter alloc] init];
		formatter.dateFormat = @"yyyy.MM.dd";
		formatter.timeZone = [NSTimeZone defaultTimeZone];
	});
	
	return formatter;
}

- (NSDate *)thv_dateWithoutTime {
	NSString *stringDate = [[NSDate thv_formatterForDateWithoutTime] stringFromDate:self];
	NSDate *formattedDate = [[NSDate thv_formatterForDateWithoutTime] dateFromString:stringDate];
	return formattedDate;
}

@end
