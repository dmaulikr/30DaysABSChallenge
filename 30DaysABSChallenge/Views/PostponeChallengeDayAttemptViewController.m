//
//  PostponeChallengeDayAttemptViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 13/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "PostponeChallengeDayAttemptViewController.h"
#import "ChallengeAttempt.h"
#import "NSDate+THVDateAdditions.h"

NSString *const THVUnwindToDayDetailsSegueId = @"unwindToDayDetails";

@implementation PostponeChallengeDayAttemptViewController

- (void)viewDidLoad {
	NSDate *minDateForDatePicker = self.selectedChallengeDay.challengeDayAttemptDate;
	
	NSArray<ChallengeDayAttempt *> *challengeDaysArray = [self.selectedChallengeDay.challengeAttempt.challengeDayAttemptsList array];
	NSInteger selectedChallengeDayIndex = [challengeDaysArray indexOfObject:self.selectedChallengeDay];
	
	if (selectedChallengeDayIndex != NSNotFound && selectedChallengeDayIndex > 0) {
		minDateForDatePicker = [[challengeDaysArray objectAtIndex:(selectedChallengeDayIndex - 1)].challengeDayAttemptDate dateByAddingTimeInterval:24.*60.*60];
	}
	
	self.datePicker.minimumDate = minDateForDatePicker;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
	if ([identifier isEqualToString:THVUnwindToDayDetailsSegueId] && [sender isKindOfClass:[NSDate class]]) {
		return YES;
	}
	return NO;
}

- (IBAction)saveButtonTapped:(id)sender {
	NSDate *postponedDate = [self.datePicker.date thv_dateWithoutTime];
	NSTimeInterval __block timeInterval = [postponedDate timeIntervalSinceDate:self.selectedChallengeDay.challengeDayAttemptDate];
	
	if (timeInterval) {
		
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure you want to change date of this challenge day attempt and dates of all following challenge days?" preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
			[self dismissViewControllerAnimated:YES completion:nil];
			[self performSegueWithIdentifier:THVUnwindToDayDetailsSegueId sender:[NSDate distantPast]];
		}]];
		PostponeChallengeDayAttemptViewController __block *this = self;
		[alert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
			NSDate *selectedDayNewAttemptDate = [this postponeStartingFromSelectedDayWithTimeInterval:timeInterval];
			[this dismissViewControllerAnimated:YES completion:nil];
			[self performSegueWithIdentifier:THVUnwindToDayDetailsSegueId sender:selectedDayNewAttemptDate];
		}]];
		[self presentViewController:alert animated:YES completion:nil];
	} else {
		[self dismissViewControllerAnimated:YES completion:nil];
		[self performSegueWithIdentifier:THVUnwindToDayDetailsSegueId sender:[NSDate distantPast]];
	}
}

#pragma mark - helper methods
- (NSDate *)postponeStartingFromSelectedDayWithTimeInterval:(NSTimeInterval)timeInterval {
	NSDate *selectedDayNewAttemptDate = [self.selectedChallengeDay.challengeDayAttemptDate dateByAddingTimeInterval:timeInterval];
	
	ChallengeAttempt *challengeAttempt = self.selectedChallengeDay.challengeAttempt;
	NSArray<ChallengeDayAttempt *> *challengeDaysArray = [challengeAttempt.challengeDayAttemptsList array];
	NSInteger selectedChallengeDayIndex = [challengeDaysArray indexOfObject:self.selectedChallengeDay];
	
	if (selectedChallengeDayIndex == 0) {
		challengeAttempt.startDate = selectedDayNewAttemptDate;
	} else {
		challengeAttempt.startDate = challengeAttempt.startDate;
	}
	
	if (selectedChallengeDayIndex != NSNotFound) {
		for (NSInteger i = selectedChallengeDayIndex; i < challengeDaysArray.count; i++) {
			ChallengeDayAttempt *challengeDay = [challengeDaysArray objectAtIndex:i];
			challengeDay.challengeDayAttemptDate = [challengeDay.challengeDayAttemptDate dateByAddingTimeInterval:timeInterval];
		}
	}
	
	[self saveContext];
	
	[challengeAttempt scheduleNextNotification];
	
	return selectedDayNewAttemptDate;
}

- (void)saveContext {
	NSError *error = nil;
	if (![((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext save:&error]) {
		NSLog(@"Could not save changes after postpone action!\n%@\n%@", error.localizedDescription, error.userInfo);
	}
}

@end
