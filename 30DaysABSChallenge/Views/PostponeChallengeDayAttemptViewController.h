//
//  PostponeChallengeDayAttemptViewController.h
//  30DaysABSChallenge
//
//  Created by KRKT on 13/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeDayAttempt.h"

extern NSString *const THVUnwindToDayDetailsSegueId;

@interface PostponeChallengeDayAttemptViewController : UIViewController

@property (nonatomic) ChallengeDayAttempt *selectedChallengeDay;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)saveButtonTapped:(id)sender;


@end
