//
//  ChosenChallengeConfigurationViewController.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeDataProtocol.h"

@interface ChosenChallengeConfigurationViewController : UIViewController

@property (nonatomic) id<ChallengeDataProtocol> selectedChallenge;

@property (weak, nonatomic) IBOutlet UIDatePicker *startingFromDatePicker;
@property (weak, nonatomic) IBOutlet UISwitch *reminderSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *reminderTimeDatePicker;
@end
