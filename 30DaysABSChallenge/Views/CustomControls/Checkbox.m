//
//  Checkbox.m
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "Checkbox.h"
#import <QuartzCore/QuartzCore.h>
#import "CheckboxLayerChecked.h"
#import "CheckboxLayerUnchecked.h"

@implementation Checkbox {
	CheckboxLayerChecked *_checkedLayer;
	CheckboxLayerUnchecked *_uncheckedLayer;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		
		self.backgroundColor = [UIColor whiteColor];
		
		_checkedLayer = [CheckboxLayerChecked layer];
		[self.layer addSublayer:_checkedLayer];
		
		_uncheckedLayer = [CheckboxLayerUnchecked layer];
		[self.layer addSublayer:_uncheckedLayer];
		
		[self setLayerFrames];
		[self updateLayersVisibility];
	}
	
	return self;
}

- (void)setLayerFrames {
	_checkedLayer.frame = self.bounds;
	[_checkedLayer setNeedsDisplay];
	
	_uncheckedLayer.frame = self.bounds;
	[_uncheckedLayer setNeedsDisplay];
}

- (void)updateLayersVisibility {
	_checkedLayer.hidden = !self.isChecked;
	_uncheckedLayer.hidden = self.isChecked;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
	self.checked = !self.isChecked;
	[self.delegate checkboxWasChecked:self.checked];
	[self updateLayersVisibility];
}

@end
