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
#import "Commons.h"
#import "MainViewController.h"

NSString *const THVUnwindToMainSegueId = @"unwindToMain";

@interface ChosenChallengeConfigurationViewController ()

@end

@implementation ChosenChallengeConfigurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = [self.selectedChallenge challengeName];
	self.title = [self.selectedChallenge challengeName];
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
		challengeAttempt.startDate = self.startingFromDatePicker.date;
		challengeAttempt.state = @(THVChallengeAttemptStateActive);
		if ([self.selectedChallenge isKindOfClass:[Challenge class]]) {
			challengeAttempt.challenge = (Challenge *)self.selectedChallenge;
		}
		
		for (int i = 0; i < [[self.selectedChallenge daysListOfChallenge] count]; i++) {
			id<ChallengeDayDataProtocol> challengeDay = [[self.selectedChallenge daysListOfChallenge] objectAtIndex:i];
			
			ChallengeDayAttempt *challengeDayAttempt = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDayAttempt entityName] inManagedObjectContext:moc];
			challengeDayAttempt.challengeDayAttemptDate = [self.startingFromDatePicker.date dateByAddingTimeInterval:24.*60.*60.*i];
			challengeDayAttempt.completed = [NSNumber numberWithBool:NO];
			if ([challengeDay isKindOfClass:[ChallengeDay class]]) {
				challengeDayAttempt.challengeDay = (ChallengeDay *)challengeDay;
			}
			
			[challengeAttempt addChallengeDayAttemptsListObject:challengeDayAttempt];
		}
		
		NSError *error = nil;
		if (![moc save:&error]) {
			NSLog(@"Could not save challenge attempt!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
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

@end
