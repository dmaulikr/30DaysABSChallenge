//
//  ChallengeDetailsCollectionViewCell.m
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDetailsCollectionViewCell.h"
#import "Commons.h"

@interface ChallengeDetailsCollectionViewCell ()

@property (nonatomic) UISwipeGestureRecognizer *leftSwipeRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *rightSwipeRecognizer;

@property (nonatomic) UIColor *completedColor;
@property (nonatomic) UIColor *delayedColor;

@end

@implementation ChallengeDetailsCollectionViewCell

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
	self.leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
	[self addGestureRecognizer:self.leftSwipeRecognizer];
	
	self.rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
	self.rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
	[self addGestureRecognizer:self.rightSwipeRecognizer];
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	self.underlyingView.backgroundColor = self.isCompleted ? self.delayedColor : self.completedColor;
	self.underlyingLabel.text = self.isCompleted ? @"Mark NOT completed" : @"Mark completed";
	
	if (self.underlyingViewRevealed) {
		[UIView animateWithDuration:0.2 animations:^{
			CGRect internalCellViewFrame = self.internalCellView.frame;
			internalCellViewFrame.origin.x = internalCellViewFrame.origin.x - (internalCellViewFrame.size.width * 0.85);
			self.internalCellView.frame = internalCellViewFrame;
		}];
	} else {
		[UIView animateWithDuration:0.2 animations:^{
			CGRect internalCellViewFrame = self.internalCellView.frame;
			internalCellViewFrame.origin.x = 2;
			self.internalCellView.frame = internalCellViewFrame;
		}];
	}
}

- (void)removeGestureRecognizers {
	[self removeGestureRecognizer:self.leftSwipeRecognizer];
	[self removeGestureRecognizer:self.rightSwipeRecognizer];
}

- (void)handleSwipe:(UIGestureRecognizer *)recognizer {
	if (recognizer == self.leftSwipeRecognizer) {
		if (!self.underlyingViewRevealed) {
			self.underlyingViewRevealed = YES;
		}
	} else if (recognizer == self.rightSwipeRecognizer) {
		if (self.underlyingViewRevealed) {
			self.underlyingViewRevealed = NO;
		}
	}
}

- (void)setUnderlyingViewRevealed:(BOOL)underlyingViewRevealed {
	_underlyingViewRevealed = underlyingViewRevealed;
	[self setNeedsDisplay];
}

- (UIColor *)completedColor {
	if (!_completedColor) {
		_completedColor = [UIColor colorWithRed:THVCompletedColorR green:THVCompletedColorG blue:THVCompletedColorB alpha:THVCompletedColorA];
	}
	
	return _completedColor;
}

- (UIColor *)delayedColor {
	if (!_delayedColor) {
		_delayedColor = [UIColor colorWithRed:THVDelayedColorR green:THVDelayedColorG blue:THVDelayedColorB alpha:THVDelayedColorA];
	}
	
	return _delayedColor;
}



@end
