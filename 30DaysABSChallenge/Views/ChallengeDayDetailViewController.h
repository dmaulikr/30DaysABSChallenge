//
//  ChallengeDayDetailViewController.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeDayDataProtocol.h"

@interface ChallengeDayDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *dayNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayAttemptDateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dayAttemptDateLabelHeightConstraint;

@property (nonatomic) NSString *challangeName;
@property (nonatomic) id<ChallengeDayDataProtocol> selectedChallangeDay;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@property (weak, nonatomic) IBOutlet UIView *markAsCompletedView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markAsCompletedViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *markAsCompletedButton;
@property (weak, nonatomic) IBOutlet UIButton *markAsCompletedViewLabel;
@end
