//
//  ChosenChallengeConfigurationViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChosenChallengeConfigurationViewController.h"
#import "ChallengeAttempt.h"
#import "ChallengeDayAttempt.h"
#import "Challenge.h"
#import "ChallengeDay.h"
#import "ChallengeDayDataProtocol.h"
#import "Exercise.h"
#import "ExerciseAttempt.h"
#import "Commons.h"
#import "MainViewController.h"
#import "NSDate+THVDateAdditions.h"

NSString *const THVUnwindToMainSegueId = @"unwindToMain";

@interface ChosenChallengeConfigurationViewController () {
	NSDate *originalStartDate;
}

@end

@implementation ChosenChallengeConfigurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = [self.selectedChallenge challengeName];
	self.title = [self.selectedChallenge challengeName];
	
	if ([self.selectedChallenge isKindOfClass:[ChallengeAttempt class]]) {
		[self configureViewForShowingDetailsOfChallengeAttempt];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVUnwindToMainSegueId]) {
		NSManagedObjectContext *moc = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
		
		ChallengeAttempt *challengeAttempt = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeAttempt entityName] inManagedObjectContext:moc];
		
		challengeAttempt.currentDay = @(1);
		challengeAttempt.reminderActive = [NSNumber numberWithBool:self.reminderSwitch.isOn];
		challengeAttempt.reminderTime = self.reminderSwitch.isOn ? [[Commons challengeTimeReminderFormatter] stringFromDate:self.reminderTimeDatePicker.date] : nil;
		challengeAttempt.startDate = [self.startingFromDatePicker.date thv_dateWithoutTime];
		challengeAttempt.state = @(THVChallengeAttemptStateActive);
		if ([self.selectedChallenge isKindOfClass:[Challenge class]]) {
			challengeAttempt.challenge = (Challenge *)self.selectedChallenge;
		}
		
		for (int i = 0; i < [[self.selectedChallenge daysListOfChallenge] count]; i++) {
			id<ChallengeDayDataProtocol> challengeDay = [[self.selectedChallenge daysListOfChallenge] objectAtIndex:i];
			
			ChallengeDayAttempt *challengeDayAttempt = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDayAttempt entityName] inManagedObjectContext:moc];
			challengeDayAttempt.challengeDayAttemptDate = [challengeAttempt.startDate dateByAddingTimeInterval:24.*60.*60.*i];
			challengeDayAttempt.completed = [NSNumber numberWithBool:NO];
			challengeDayAttempt.challengeAttempt = challengeAttempt;
			if ([challengeDay isKindOfClass:[ChallengeDay class]]) {
				challengeDayAttempt.challengeDay = (ChallengeDay *)challengeDay;
			}
			
			for (int j = 0; j < [[challengeDay exerciseListOfDay] count]; j++) {
				id<ExerciseDataProtocol> exercise = [[challengeDay exerciseListOfDay] objectAtIndex:j];
				
				ExerciseAttempt *exerciseAttempt = [NSEntityDescription insertNewObjectForEntityForName:[ExerciseAttempt entityName] inManagedObjectContext:moc];
				exerciseAttempt.completed = [NSNumber numberWithBool:NO];
				exerciseAttempt.completionDate = nil;
				exerciseAttempt.challengeDayAttempt = challengeDayAttempt;
				if ([exercise isKindOfClass:[Exercise class]]) {
					exerciseAttempt.exercise = (Exercise *)exercise;
				}
			}
		}
		
		[self saveContext];
	}
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
	if ([self.selectedChallenge isKindOfClass:[ChallengeAttempt class]]) {
		
		ChallengeAttempt __block *challengeAttempt = (ChallengeAttempt *)self.selectedChallenge;
		
		challengeAttempt.reminderActive = [NSNumber numberWithBool:self.reminderSwitch.isOn];
		challengeAttempt.reminderTime = self.reminderSwitch.isOn ? [[Commons challengeTimeReminderFormatter] stringFromDate:self.reminderTimeDatePicker.date] : nil;
		
		BOOL shouldSaveContextAndPopViewController = YES;
		
		if (![originalStartDate isEqualToDate:[self.startingFromDatePicker.date thv_dateWithoutTime]]) {
			
			shouldSaveContextAndPopViewController = NO;
			
			UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure you want to change start date of this challenge attempt and dates of all challenge days associated?" preferredStyle:UIAlertControllerStyleAlert];
			[alert addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil]];
			ChosenChallengeConfigurationViewController __block *this = self;
			[alert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
				[this updateChallengeAttempt:challengeAttempt withNewStartDate:[this.startingFromDatePicker.date thv_dateWithoutTime]];
				[this saveContext];
				[this.navigationController popViewControllerAnimated:YES];
			}]];
			[self presentViewController:alert animated:YES completion:nil];
		}
		
		if (shouldSaveContextAndPopViewController) {
			[self saveContext];
			[self.navigationController popViewControllerAnimated:YES];
		}
		
		return NO;
	} else {
		return YES;
	}
}

- (IBAction)reminderSwitchTapped:(id)sender {
	[UIView transitionWithView:self.reminderTimeDatePicker
					  duration:0.4
					   options:UIViewAnimationOptionTransitionCrossDissolve
					animations:^{
						self.reminderTimeDatePicker.hidden = !self.reminderSwitch.isOn;
					}
					completion:nil];
}

- (void)configureViewForShowingDetailsOfChallengeAttempt {
	ChallengeAttempt *selectedChallengeAttempt = (ChallengeAttempt *)self.selectedChallenge;
	
	originalStartDate = selectedChallengeAttempt.startDate;
	
	self.startingFromDatePicker.date = selectedChallengeAttempt.startDate;
	
	[self.reminderSwitch setOn:[selectedChallengeAttempt.reminderActive boolValue]];
	
	if ([selectedChallengeAttempt.reminderActive boolValue]) {
		self.reminderTimeDatePicker.hidden = !self.reminderSwitch.isOn;
		self.reminderTimeDatePicker.date = [[Commons challengeTimeReminderFormatter] dateFromString:selectedChallengeAttempt.reminderTime];
	}
}

#pragma mark - helper methods
- (void)saveContext {
	NSError *error = nil;
	if (![((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext save:&error]) {
		NSLog(@"Could not save challenge day attempt!\n%@\n%@", error.localizedDescription, error.userInfo);
	}
}

- (void)updateChallengeAttempt:(ChallengeAttempt *)challengeAttempt withNewStartDate:(NSDate *)startDate {
	challengeAttempt.startDate = startDate;
	
	for (int i = 0; i < [challengeAttempt.challengeDayAttemptsList array].count; i++) {
		ChallengeDayAttempt *challengeDayAttempt = [[challengeAttempt.challengeDayAttemptsList array] objectAtIndex:i];
		challengeDayAttempt.challengeDayAttemptDate = [challengeAttempt.startDate dateByAddingTimeInterval:24.*60.*60.*i];
	}
}

@end
