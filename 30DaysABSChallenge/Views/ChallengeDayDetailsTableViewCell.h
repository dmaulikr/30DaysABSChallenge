//
//  ChallengeDayDetailsTableViewCell.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChallengeDayDetailsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseAmountLabel;
@property (weak, nonatomic) IBOutlet UIView *timerView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@property (nonatomic) BOOL isATimerCell;

@end
