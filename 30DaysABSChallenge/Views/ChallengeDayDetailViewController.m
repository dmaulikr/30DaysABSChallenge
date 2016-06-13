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
#import "ChallengeAttempt.h"
#import "Commons.h"
#import "NSDate+THVDateAdditions.h"
#import "ExerciseDataProtocol.h"
#import "Exercise.h"
#import "ExerciseAttempt.h"
#import "PostponeChallengeDayAttemptViewController.h"

NSString *const THVChallengeDayDetailsTableViewCellId = @"challengeDayDetailsTableViewCellId";
NSString *const THVMarkAsCompletedLabelString = @"Mark as completed";
NSString *const THVMarkAsNotCompletedLabelString = @"Mark as NOT completed";

NSString *const THVShowPostponePopoverSegueId = @"showPostponePopover";

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
	
	if (showOnly) {
		self.navigationItem.rightBarButtonItems = [NSMutableArray array];
	}
	
	[self setupMarkAsCompletedView];
	[self setupDayAttemptDateLabel];
	
	self.navigationItem.title = self.challangeName;
	self.dayNumberLabel.text = [NSString stringWithFormat:@"Day %@", [self.selectedChallangeDay challengeDayNumber]];
	
	if ([[self.selectedChallangeDay exerciseListOfDay] count]) {
		[self.placeholderLabel removeFromSuperview];
	} else {
		self.tableView.hidden = YES;
	}
	
	if ([self.selectedChallangeDay isKindOfClass:[ChallengeDayAttempt class]] && ![((ChallengeDayAttempt *)self.selectedChallangeDay).dayAttemptDate isEqualToDate:[[NSDate date] thv_dateWithoutTime]] && ![self.selectedChallangeDay isCompleted]) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Watch out!" message:@"Selected challenge day's date does not match today's date." preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
		[self presentViewController:alert animated:YES completion:nil];
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(markAsCompletedNotificationReceived:) name:THVMarkAsCompletedNotificationName object:nil];
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
	[self saveContext];
	[super viewWillDisappear:animated];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVShowPostponePopoverSegueId]) {
		PostponeChallengeDayAttemptViewController *destinationVC = segue.destinationViewController;
		destinationVC.preferredContentSize = CGSizeMake(self.view.frame.size.width * 0.8, self.view.frame.size.height * 0.4);
		destinationVC.selectedChallengeDay = self.selectedChallangeDay;
		
		UIPopoverPresentationController *popoverController = destinationVC.popoverPresentationController;
		popoverController.delegate = self;
	}
}

#pragma mark - table view helper methods
- (void)configureCell:(ChallengeDayDetailsTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
	
	id<ExerciseDataProtocol> exerciseForCell = [[self.selectedChallangeDay exerciseListOfDay] objectAtIndex:indexPath.row];
	
	cell.exerciseNameLabel.text = [exerciseForCell exerciseName];
	cell.isATimerCell = NO;
	cell.timerView.hidden = YES;
	cell.exercise = exerciseForCell;
	cell.delegate = self;
	
	switch ([[exerciseForCell exerciseType] integerValue]) {
		case THVExerciseTypeRepetition:
			cell.exerciseAmountLabel.text = [NSString stringWithFormat:@"x %@", [exerciseForCell exerciseAmount]];
			break;
		case THVExerciseTypeTime:
			cell.exerciseAmountLabel.text = [NSString stringWithFormat:@"%@s", [exerciseForCell exerciseAmount]];
			cell.isATimerCell = YES;
			
			if (currentTimerValue && [exerciseForCell respondsToSelector:@selector(exerciseIsCompleted)] && ![exerciseForCell exerciseIsCompleted]) {
				cell.timerView.hidden = NO;
				[cell bringSubviewToFront:cell.timerView];
				cell.counterLabel.text = [NSString stringWithFormat:@"%@", currentTimerValue];
			}
			
			break;
		case THVExerciseTypeToDo:
			[cell.exerciseAmountLabel removeFromSuperview];
			break;
	}
	
	if (showOnly) {
		[cell.checkboxView removeFromSuperview];
	} else {
		[cell setupCheckbox];
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
	
	if (!showOnly && ![self.selectedChallangeDay isCompleted] && (![cell.exercise exerciseIsCompleted] || (![[cell.exercise exerciseType] isEqualToNumber:[NSNumber numberWithInteger:THVExerciseTypeTime]] && cellTimer))) {
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

#pragma mark - CheckboxDelegate methods
- (void)checkboxWasChecked:(BOOL)checked {
	if (!checked) {
		[self markSelectedChallengeDayAttemptAsCompleted:checked markAllExercises:NO andPopViewController:NO];
	} else if ([[self.selectedChallangeDay exerciseListOfDay] count] == [[[self.selectedChallangeDay exerciseListOfDay] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"completed == %@", [NSNumber numberWithBool:checked]]] count]) {
			
			[self markSelectedChallengeDayAttemptAsCompleted:checked markAllExercises:YES andPopViewController:NO];
		}
}

#pragma mark - helper methods
- (void)countDownWithTimer:(NSTimer *)timer {
	if ([currentTimerValue integerValue] == 0) {
		if ([cellWithTimer.exercise isKindOfClass:[ExerciseAttempt class]]) {
			[cellWithTimer.checkbox endTrackingWithTouch:nil withEvent:nil];
			[self.tableView reloadRowsAtIndexPaths:@[indexPathOfCellWithTimer] withRowAnimation:UITableViewRowAnimationNone];
		}
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

- (void)markSelectedChallengeDayAttemptAsCompleted:(BOOL)isCompleted markAllExercises:(BOOL)markAllExercises andPopViewController:(BOOL)popViewController {
	NSDate *currentDate = [NSDate date];
	
	((ChallengeDayAttempt *)self.selectedChallangeDay).completed = [NSNumber numberWithBool:isCompleted];
	((ChallengeDayAttempt *)self.selectedChallangeDay).completionDate = isCompleted ? currentDate : nil;
	
	if (markAllExercises) {
		[[self.selectedChallangeDay exerciseListOfDay] makeObjectsPerformSelector:@selector(setCompleted:) withObject:[NSNumber numberWithBool:isCompleted]];
		[[self.selectedChallangeDay exerciseListOfDay] makeObjectsPerformSelector:@selector(setCompletionDate:) withObject:isCompleted ? currentDate : nil];
	}
	
	[self checkIfWholeChallengeIsCompletedAndSetAppropriateStatusWithChallengeDayAttempt:self.selectedChallangeDay];
	
	[self saveContext];
	
	[((ChallengeDayAttempt *)self.selectedChallangeDay).challengeAttempt scheduleNextNotification];
	
	if (popViewController) {
		[self.navigationController popViewControllerAnimated:YES];
	} else {
		[self setupMarkAsCompletedView];
		[self.tableView reloadData];
	}
}

- (void)markAsCompletedNotificationReceived:(NSNotification *)notification {
	if (self.selectedChallangeDay == notification.object) {
		if (cellTimer) {
			[self invalidateTimer];
		}
		[self setupMarkAsCompletedView];
		[self.tableView reloadData];
	}
}

- (void)setupDayAttemptDateLabel {
	if ([self.selectedChallangeDay respondsToSelector:@selector(dayAttemptDate)]) {
		self.dayAttemptDateLabel.text = [[Commons challengeDayDateFormatter] stringFromDate:[self.selectedChallangeDay dayAttemptDate]];
	} else {
		self.dayAttemptDateLabelHeightConstraint.constant = 0.0;
	}
}

- (void)checkIfWholeChallengeIsCompletedAndSetAppropriateStatusWithChallengeDayAttempt:(ChallengeDayAttempt *)challengeDayAttempt {
	ChallengeAttempt *challengeAttempt = challengeDayAttempt.challengeAttempt;
	
	NSSet *allCompletedValuesFromDayAttempts = [NSSet setWithArray:[[challengeAttempt.challengeDayAttemptsList array] valueForKey:@"completed"]];
	
	if (allCompletedValuesFromDayAttempts.count == 1 && [(NSNumber *)allCompletedValuesFromDayAttempts.anyObject boolValue]) {
		challengeAttempt.state = [NSNumber numberWithInteger:THVChallengeAttemptStateCompleted];
	} else {
		challengeAttempt.state = [NSNumber numberWithInteger:THVChallengeAttemptStateActive];
	}
}

- (void)saveContext {
	NSError *error = nil;
	if (![((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext save:&error]) {
		NSLog(@"Could not save challenge day attempt!\n%@\n%@", error.localizedDescription, error.userInfo);
	}
}

#pragma mark - UIPopoverPresentationControllerDelegate methods
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
	return UIModalPresentationNone;
}

#pragma mark - ibaction methods
- (IBAction)markAsCompletedButtonTapped:(id)sender {
	if ([self.selectedChallangeDay isKindOfClass:[ChallengeDayAttempt class]]) {
		if (![self.selectedChallangeDay isCompleted]) {
			[self markSelectedChallengeDayAttemptAsCompleted:YES markAllExercises:YES andPopViewController:YES];
		} else {
			[self markSelectedChallengeDayAttemptAsCompleted:NO markAllExercises:YES andPopViewController:NO];
		}
	}
}

- (IBAction)unwindFromPostponePopover:(UIStoryboardSegue *)segue {
	if ([segue.identifier isEqualToString:THVUnwindToDayDetailsSegueId]) {
		self.dayAttemptDateLabel.text = [[Commons challengeDayDateFormatter] stringFromDate:[self.selectedChallangeDay dayAttemptDate]];
	}
}

@end
