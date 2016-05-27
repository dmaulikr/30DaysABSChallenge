//
//  AddChallengeViewController.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddChallengeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)chooseButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *challengeTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *chooseButton;

@end
