//
//  ChallengeDetailsViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDetailsViewController.h"
#import "ChosenChallengeConfigurationViewController.h"

NSString *const THVGoToChosenChallengeConfigurationScreen = @"chosenChallangeScreenFromDetails";

@interface ChallengeDetailsViewController ()

@end

@implementation ChallengeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segue methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVGoToChosenChallengeConfigurationScreen]) {
		ChosenChallengeConfigurationViewController *destinationVC = [segue destinationViewController];
		destinationVC.selectedChallenge = self.selectedChallenge;
	}
}

@end
