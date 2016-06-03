//
//  CheckboxLayer.m
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "CheckboxLayer.h"
#import "Commons.h"

@implementation CheckboxLayer

#pragma mark - lazy initializers
- (UIColor *)notCompletedColor {
	if (!_notCompletedColor) {
		_notCompletedColor = [UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:THVCompletedColorA];
	}
	
	return _notCompletedColor;
}

- (UIColor *)completedColor {
	if (!_completedColor) {
		_completedColor = [UIColor colorWithRed:THVCompletedColorR green:THVCompletedColorG blue:THVCompletedColorB alpha:THVCompletedColorA];
	}
	
	return _completedColor;
}

- (CGRect)checkboxCircleFrame {
	if (_checkboxCircleFrame.size.height == 0.0 &&
		_checkboxCircleFrame.size.width == 0.0 &&
		_checkboxCircleFrame.origin.x == 0.0 &&
		_checkboxCircleFrame.origin.y == 0.0) {
		
		_checkboxCircleFrame = CGRectInset(self.bounds, 2.0, 2.0);
	}
	
	return _checkboxCircleFrame;
}

- (UIBezierPath *)circlePath {
	if (!_circlePath) {
		_circlePath = [UIBezierPath bezierPathWithOvalInRect:self.checkboxCircleFrame];
	}
	
	return _circlePath;
}

- (CGFloat)circlePathSize {
	if (_circlePathSize == 0.0) {
		_circlePathSize = 2.0;
	}
	
	return _circlePathSize;
}

- (UIBezierPath *)checkMarkPath {
	if (!_checkMarkPath) {
		
		_checkMarkPath = [UIBezierPath bezierPath];
		[_checkMarkPath moveToPoint:CGPointMake(self.bounds.size.width * 0.25, self.bounds.size.height * 0.4)];
		[_checkMarkPath addLineToPoint:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.7)];
		[_checkMarkPath addLineToPoint:CGPointMake(self.bounds.size.width * 0.9, 0.0)];
	}
	
	return _checkMarkPath;
}

- (CGFloat)checkMarkPathBackgroundSize {
	if (_checkMarkPathBackgroundSize == 0.0) {
		_checkMarkPathBackgroundSize = 7.0;
	}
	
	return _checkMarkPathBackgroundSize;
}

- (CGFloat)checkMarkPathSize {
	if (_checkMarkPathSize == 0.0) {
		_checkMarkPathSize = 2.5;
	}
	
	return _checkMarkPathSize;
}

@end
