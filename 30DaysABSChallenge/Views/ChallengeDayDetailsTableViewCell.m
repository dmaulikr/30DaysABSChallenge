//
//  ChallengeDayDetailsTableViewCell.m
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDayDetailsTableViewCell.h"
#import "ExerciseAttempt.h"

@implementation ChallengeDayDetailsTableViewCell

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)setupCheckbox {
	if (!_checkbox) {
		_checkbox = [[Checkbox alloc] initWithFrame:self.checkboxView.bounds];
		self.checkbox.delegate = self;
		[self.checkboxView addSubview:self.checkbox];
	}
	self.checkbox.checked = [self.exercise respondsToSelector:@selector(exerciseIsCompleted)] ? [self.exercise exerciseIsCompleted] : NO;
	[self.checkbox updateLayersVisibility];
}

#pragma mark - CheckboxDelegate methods
- (void)checkboxWasChecked:(BOOL)checked {
	if ([self.exercise isKindOfClass:[ExerciseAttempt class]]) {
		((ExerciseAttempt *)self.exercise).completed = [NSNumber numberWithBool:checked];
		if (checked) {
			((ExerciseAttempt *)self.exercise).completionDate = [NSDate date];
		} else {
			((ExerciseAttempt *)self.exercise).completionDate = nil;
		}
		
		[self.delegate checkboxWasChecked:checked];
	}
}

@end
