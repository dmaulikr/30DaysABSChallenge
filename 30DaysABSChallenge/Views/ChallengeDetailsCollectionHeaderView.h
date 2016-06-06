//
//  ChallengeDetailsCollectionHeaderView.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChallengeDetailsCollectionHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerLabelCenterYAlignmentConstraint;
@property (weak, nonatomic) IBOutlet UILabel *additionalInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *detailsButton;

@end
