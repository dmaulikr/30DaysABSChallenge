//
//  ChallengeDetailsCollectionViewCell.h
//  30DaysABSChallenge
//
//  Created by KRKT on 30/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChallengeDetailsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayDateLabel;
@property (weak, nonatomic) IBOutlet UIView *internalCellView;

@end
