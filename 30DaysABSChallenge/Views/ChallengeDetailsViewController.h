//
//  ChallengeDetailsViewController.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeDataProtocol.h"

@interface ChallengeDetailsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) id<ChallengeDataProtocol> selectedChallenge;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
