//
//  UILocalNotification+THVPrintingAdditions.m
//  30DaysABSChallenge
//
//  Created by KRKT on 07/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "UILocalNotification+THVPrintingAdditions.h"

@implementation UILocalNotification (THVPrintingAdditions)

- (NSString *)thv_description {
	return [NSString stringWithFormat:@"fireDate = %@, userInfo = %@", self.fireDate, self.userInfo];
}

- (void)setThv_description:(NSString *)thv_description {
	
}

@end
