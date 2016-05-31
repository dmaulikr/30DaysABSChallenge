//
//  ChallengeDayDetailViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDayDetailViewController.h"
#import "ChallengeDayDetailsTableViewCell.h"
#import "Commons.h"

NSString *const THVChallengeDayDetailsTableViewCellId = @"challengeDayDetailsTableViewCellId";

@interface ChallengeDayDetailViewController () {
	ChallengeDayDetailsTableViewCell *cellWithTimer;
	NSIndexPath *indexPathOfCellWithTimer;
	NSTimer *cellTimer;
	NSNumber *currentTimerValue;
	
	BOOL showOnly;
}
@end

@implementation ChallengeDayDetailViewController

- (void)viewDidLoad {
	self.navigationItem.title = self.challangeName;
	self.dayNumberLabel.text = [NSString stringWithFormat:@"Day %@", [self.selectedChallangeDay challengeDayNumber]];
	
	if ([[self.selectedChallangeDay exerciseListOfDay] count]) {
		[self.tableView reloadData];
		if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
			self.tableView.scrollEnabled = NO;
		} else {
			self.tableView.scrollEnabled = YES;
		}
		[self.placeholderLabel removeFromSuperview];
	} else {
		self.tableView.hidden = YES;
	}
	
	showOnly = ![self.selectedChallangeDay respondsToSelector:@selector(isCompleted)];
	
	[self setupMarkAsCompletedView];
}

- (void)viewWillDisappear:(BOOL)animated {
	if (cellTimer) {
		[cellTimer invalidate];
		cellTimer = nil;
	}
	[super viewWillDisappear:animated];
}

#pragma mark - table view helper methods
- (void)configureCell:(ChallengeDayDetailsTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
	
	Exercise *exerciseForCell = [[self.selectedChallangeDay exerciseListOfDay] objectAtIndex:indexPath.row];
	
	cell.exerciseNameLabel.text = exerciseForCell.name;
	cell.isATimerCell = NO;
	cell.timerView.hidden = YES;
	
	switch ([exerciseForCell.type integerValue]) {
		case THVExerciseTypeRepetition:
			cell.exerciseAmountLabel.text = [NSString stringWithFormat:@"x %@", exerciseForCell.amount];
			break;
		case THVExerciseTypeTime:
			cell.exerciseAmountLabel.text = [NSString stringWithFormat:@"%@s", exerciseForCell.amount];
			cell.isATimerCell = YES;
			
			if (currentTimerValue) {
				cell.timerView.hidden = NO;
				[cell bringSubviewToFront:cell.timerView];
				cell.counterLabel.text = [NSString stringWithFormat:@"%@", currentTimerValue];
			}
			
			break;
		case THVExerciseTypeToDo:
			[cell.exerciseAmountLabel removeFromSuperview];
			break;
	}
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[self.selectedChallangeDay exerciseListOfDay] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	ChallengeDayDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:THVChallengeDayDetailsTableViewCellId];
	
	[self configureCell:cell forIndexPath:indexPath];
	
	return cell;
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (!showOnly) {
		ChallengeDayDetailsTableViewCell *cell = (ChallengeDayDetailsTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
		
		if (cell.isATimerCell) {
			cellWithTimer = cell;
			indexPathOfCellWithTimer = indexPath;
			
			NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
			formatter.numberStyle = NSNumberFormatterDecimalStyle;
			currentTimerValue = [formatter numberFromString:[cell.exerciseAmountLabel.text stringByReplacingOccurrencesOfString:@"s" withString:@""]];
			
			[self scheduleTimer];
			
			[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
		} else if (cellTimer) {
			[self invalidateTimer];
		}
	}
}

#pragma mark - mark as completed view methods
- (void)setupMarkAsCompletedView {
	if (showOnly) {
		self.markAsCompletedViewHeightConstraint.constant = 0.0;
	} else {
		self.markAsCompletedView.backgroundColor = [UIColor colorWithRed:THVCompletedColorR green:THVCompletedColorG blue:THVCompletedColorB alpha:THVCompletedColorA];
		UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(markAsCompletedViewTapped)];
		[self.markAsCompletedView setUserInteractionEnabled:YES];
		[self.markAsCompletedView addGestureRecognizer:tapRecognizer];
	}
}

- (void)markAsCompletedViewTapped {
	[self.markAsCompletedButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - helper methods
- (void)countDownWithTimer:(NSTimer *)timer {
	if ([currentTimerValue integerValue] == 0) {
		[self invalidateTimer];
	} else {
		currentTimerValue = [NSNumber numberWithInteger:[currentTimerValue integerValue] - 1];
		[self.tableView reloadRowsAtIndexPaths:@[indexPathOfCellWithTimer] withRowAnimation:UITableViewRowAnimationNone];
	}
}

- (void)scheduleTimer {
	if (cellTimer) {
		[cellTimer invalidate];
		cellTimer = nil;
	}
	
	cellTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownWithTimer:) userInfo:nil repeats:YES];
}

- (void)invalidateTimer {
	currentTimerValue = nil;
	[self.tableView reloadRowsAtIndexPaths:@[indexPathOfCellWithTimer] withRowAnimation:UITableViewRowAnimationNone];
	
	if (cellTimer) {
		[cellTimer invalidate];
		cellTimer = nil;
	}
	cellWithTimer = nil;
	indexPathOfCellWithTimer = nil;
}

#pragma mark - ibaction methods
- (IBAction)markAsCompletedButtonTapped:(id)sender {
	NSLog(@"mark as completed button tapped");
}
@end
