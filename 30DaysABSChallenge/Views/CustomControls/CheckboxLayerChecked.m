//
//  CheckboxLayerChecked.m
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "CheckboxLayerChecked.h"
#import "Commons.h"

@implementation CheckboxLayerChecked

- (void)drawInContext:(CGContextRef)ctx {
	
	CGContextSetStrokeColorWithColor(ctx, self.completedColor.CGColor);
	CGContextSetShadowWithColor(ctx, CGSizeMake(1, 1), 1.0, [UIColor lightGrayColor].CGColor);
	CGContextSetLineWidth(ctx, self.circlePathSize);
	CGContextAddPath(ctx, self.circlePath.CGPath);
	CGContextStrokePath(ctx);
	
	CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 1.0, [UIColor whiteColor].CGColor);
	CGContextSetLineWidth(ctx, self.checkMarkPathBackgroundSize);
	CGContextAddPath(ctx, self.checkMarkPath.CGPath);
	CGContextStrokePath(ctx);
	
	CGContextSetStrokeColorWithColor(ctx, self.completedColor.CGColor);
	CGContextSetShadowWithColor(ctx, CGSizeMake(1, 1), 1.0, [UIColor lightGrayColor].CGColor);
	CGContextSetLineWidth(ctx, self.checkMarkPathSize);
	CGContextAddPath(ctx, self.checkMarkPath.CGPath);
	CGContextStrokePath(ctx);
}

@end
