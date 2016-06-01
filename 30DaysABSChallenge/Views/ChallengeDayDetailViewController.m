//
//  ChallengeDayDetailViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDayDetailViewController.h"
#import "ChallengeDayDetailsTableViewCell.h"
#import "ChallengeDayAttempt.h"
#import "Commons.h"
#import "NSDate+THVDateAdditions.h"

NSString *const THVChallengeDayDetailsTableViewCellId = @"challengeDayDetailsTableViewCellId";
NSString *const THVMarkAsCompletedLabelString = @"Mark as completed";
NSString *const THVMarkAsNotCompletedLabelString = @"Mark as NOT completed";

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
	showOnly = ![self.selectedChallangeDay respondsToSelector:@selector(isCompleted)];
	
	[self setupMarkAsCompletedView];
	[self setupDayAttemptDateLabel];
	
	self.navigationItem.title = self.challangeName;
	self.dayNumberLabel.text = [NSString stringWithFormat:@"Day %@", [self.selectedChallangeDay challengeDayNumber]];
	
	if ([[self.selectedChallangeDay exerciseListOfDay] count]) {
		[self.placeholderLabel removeFromSuperview];
	} else {
		self.tableView.hidden = YES;
	}
}

- (void)viewDidLayoutSubviews {
	if (!self.tableView.hidden) {
		if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
			self.tableView.scrollEnabled = NO;
		} else {
			self.tableView.scrollEnabled = YES;
		}
	}
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
	ChallengeDayDetailsTableViewCell *cell = (ChallengeDayDetailsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
	dispatch_async(dispatch_get_main_queue(), ^{
		[tableView scrollRectToVisible:cell.frame animated:YES];
	});
	
	if (!showOnly && ![self.selectedChallangeDay isCompleted]) {
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
		
		if (![self.selectedChallangeDay isCompleted]) {
			self.markAsCompletedView.backgroundColor = [UIColor colorWithRed:THVCompletedColorR green:THVCompletedColorG blue:THVCompletedColorB alpha:THVCompletedColorA];
			[self.markAsCompletedViewLabel setTitle:THVMarkAsCompletedLabelString forState:UIControlStateNormal];
		} else {
			self.markAsCompletedView.backgroundColor = [UIColor colorWithRed:THVDelayedColorR green:THVDelayedColorG blue:THVDelayedColorB alpha:THVDelayedColorA];
			[self.markAsCompletedViewLabel setTitle:THVMarkAsNotCompletedLabelString forState:UIControlStateNormal];
		}
		
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

- (void)markSelectedChallengeDayAttemptAsCompleted:(BOOL)isCompleted {
	((ChallengeDayAttempt *)self.selectedChallangeDay).completed = [NSNumber numberWithBool:isCompleted];
	((ChallengeDayAttempt *)self.selectedChallangeDay).completionDate = isCompleted ? [NSDate date] : nil;
	
	NSError *error = nil;
	if (![((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext save:&error]) {
		NSLog(@"Could not save challenge day attempt!\n%@\n%@", error.localizedDescription, error.userInfo);
	}
	
	if (isCompleted) {
		[self.navigationController popViewControllerAnimated:YES];
	} else {
		[self setupMarkAsCompletedView];
	}
}

- (void)setupDayAttemptDateLabel {
	if ([self.selectedChallangeDay respondsToSelector:@selector(dayAttemptDate)]) {
		self.dayAttemptDateLabel.text = [[Commons challengeDayDateFormatter] stringFromDate:[self.selectedChallangeDay dayAttemptDate]];
	} else {
		self.dayAttemptDateLabelHeightConstraint.constant = 0.0;
	}
}

#pragma mark - ibaction methods
- (IBAction)markAsCompletedButtonTapped:(id)sender {
	if ([self.selectedChallangeDay isKindOfClass:[ChallengeDayAttempt class]]) {
		if (![self.selectedChallangeDay isCompleted]) {
			if (![((ChallengeDayAttempt *)self.selectedChallangeDay).dayAttemptDate isEqualToDate:[[NSDate date] thv_dateWithoutTime]]) {
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Selected challenge day's date does not match today's date.\n\nAre you sure you want to mark this challenge day as completed?" preferredStyle:UIAlertControllerStyleAlert];
				[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
				ChallengeDayDetailViewController __block *this = self;
				[alert addAction:[UIAlertAction actionWithTitle:@"Yes, mark as completed" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
					[this markSelectedChallengeDayAttemptAsCompleted:YES];
				}]];
				[self presentViewController:alert animated:YES completion:nil];
			} else {
				[self markSelectedChallengeDayAttemptAsCompleted:YES];
			}
		} else {
			[self markSelectedChallengeDayAttemptAsCompleted:NO];
		}
	}
}
@end
