//
//  ChosenChallengeConfigurationViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChosenChallengeConfigurationViewController.h"

@interface ChosenChallengeConfigurationViewController ()

@end

@implementation ChosenChallengeConfigurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = self.selectedChallenge.name;
	self.title = self.selectedChallenge.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonTapped:(id)sender {
	//unwind
}
@end
