//
//  ChallengeDayDetailsTableViewCell.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Checkbox.h"
#import "ExerciseDataProtocol.h"
#import "CheckboxDelegate.h"

@interface ChallengeDayDetailsTableViewCell : UITableViewCell <CheckboxDelegate>

@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseAmountLabel;
@property (weak, nonatomic) IBOutlet UIView *timerView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIView *checkboxView;

@property (nonatomic) BOOL isATimerCell;

@property (nonatomic) Checkbox *checkbox;
- (void)setupCheckbox;

@property (weak, nonatomic) id<ExerciseDataProtocol> exercise;
@property (weak, nonatomic) id<CheckboxDelegate> delegate;

@end
