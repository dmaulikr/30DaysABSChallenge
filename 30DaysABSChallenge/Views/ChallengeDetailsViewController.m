//
//  ChallengeDetailsViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "ChallengeDetailsViewController.h"
#import "ChosenChallengeConfigurationViewController.h"
#import "ChallengeDetailsCollectionViewCell.h"
#import "ChallengeDayDataProtocol.h"
#import "ChallengeDetailsCollectionHeaderView.h"
#import "Commons.h"
#import "ChallengeDayDetailViewController.h"
#import "NSDate+THVDateAdditions.h"
#import "ChallengeDayAttempt.h"
#import "ChallengeAttempt.h"

NSString *const THVGoToChosenChallengeConfigurationScreen = @"chosenChallangeScreenFromDetails";
NSString *const THVShowChallengeDayDetails = @"shoChallengeDayDetails";
NSString *const THVShowDetailsOfSelectedChallengeAttempt = @"showDetailsOfChallengeAttempt";

NSString *const THVChallengeDetailsCollectionViewCellId = @"THVChallengeDetailsCollectionViewCellId";
NSString *const THVChallengeDetailsCollectionViewHeaderId = @"THVChallengeDetailsCollectionViewHeaderId";

@interface ChallengeDetailsViewController ()

@end

@implementation ChallengeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if ([self.selectedChallenge respondsToSelector:@selector(isCompleted)]) {
		NSMutableArray *navigationBarButtons = [self.navigationItem.rightBarButtonItems mutableCopy];
		[navigationBarButtons removeObject:self.chooseBarButtonItem];
		[self.navigationItem setRightBarButtonItems:navigationBarButtons];
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(markAsCompletedNotificationReceived:) name:THVMarkAsCompletedNotificationName object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
	[self.collectionView reloadData];
	
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segue methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVGoToChosenChallengeConfigurationScreen] ||
		[segue.identifier isEqualToString:THVShowDetailsOfSelectedChallengeAttempt]) {
		ChosenChallengeConfigurationViewController *destinationVC = [segue destinationViewController];
		destinationVC.selectedChallenge = self.selectedChallenge;
	} else if ([segue.identifier isEqualToString:THVShowChallengeDayDetails]) {
		ChallengeDayDetailViewController *destinationVC = [segue destinationViewController];
		if ([sender conformsToProtocol:@protocol(ChallengeDayDataProtocol)]) {
			destinationVC.selectedChallangeDay = sender;
		}
		destinationVC.challangeName = [self.selectedChallenge challengeName];
	}
}

#pragma mark - collection view helper methods
- (void)configureCell:(ChallengeDetailsCollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
	
	id<ChallengeDayDataProtocol> dayForCell = [[self.selectedChallenge daysListOfChallenge] objectAtIndex:indexPath.item];
	
	cell.dayNumberLabel.text = [NSString stringWithFormat:@"Day %@", [dayForCell challengeDayNumber]];
	cell.dayTypeLabel.text = [dayForCell dayTypeName];
	if ([dayForCell respondsToSelector:@selector(dayAttemptDate)]) {
		cell.dayDateLabel.text = [[Commons challengeDayDateFormatter] stringFromDate:[dayForCell dayAttemptDate]];
	} else {
		[cell.dayDateLabel removeFromSuperview];
	}
	cell.underlyingViewRevealed = NO;
	
	if ([dayForCell respondsToSelector:@selector(isCompleted)]) {
		cell.isCompleted = [dayForCell isCompleted];
		
		UIColor *toBeDoneColor = [UIColor whiteColor];
		UIColor *completedColor = [UIColor colorWithRed:THVCompletedColorR green:THVCompletedColorG blue:THVCompletedColorB alpha:THVCompletedColorA];
		UIColor *delayedColor = [UIColor colorWithRed:THVDelayedColorR green:THVDelayedColorG blue:THVDelayedColorB alpha:THVDelayedColorA];
		UIColor *pendingColor = [UIColor colorWithRed:THVPendingColorR green:THVPendingColorG blue:THVPendingColorB alpha:THVPendingColorA];
		
		if ([dayForCell isCompleted]) {
			cell.internalCellView.backgroundColor = completedColor;
		} else if ([dayForCell respondsToSelector:@selector(dayAttemptDate)] &&
				   [[[NSDate date] thv_dateWithoutTime] timeIntervalSinceDate:[dayForCell dayAttemptDate]] > (12. * 60. * 60.)) {
			cell.internalCellView.backgroundColor = delayedColor;
		} else if ([self.selectedChallenge isReminderActive] && [dayForCell respondsToSelector:NSSelectorFromString(@"reminderDateTime")] && [[dayForCell performSelector:NSSelectorFromString(@"reminderDateTime")] timeIntervalSinceNow] < 0) {
			cell.internalCellView.backgroundColor = pendingColor;
		} else {
			cell.internalCellView.backgroundColor = toBeDoneColor;
		}
	} else {
		[cell removeGestureRecognizers];
	}
}

#pragma mark - UICollectionViewDataSource metods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [[self.selectedChallenge daysListOfChallenge] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ChallengeDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:THVChallengeDetailsCollectionViewCellId forIndexPath:indexPath];
	
	[self configureCell:cell forIndexPath:indexPath];
	return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	ChallengeDetailsCollectionHeaderView *headerView = nil;
	
	if (kind == UICollectionElementKindSectionHeader) {
		headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:THVChallengeDetailsCollectionViewHeaderId forIndexPath:indexPath];
		headerView.headerLabel.text = [self.selectedChallenge challengeName];
		if ([self.selectedChallenge respondsToSelector:@selector(challengeStartDate)]) {
			headerView.additionalInfoLabel.text = [NSString stringWithFormat:@"Started at: %@", [[Commons challengeDayDateFormatter] stringFromDate:[self.selectedChallenge challengeStartDate]]];
			headerView.detailsButton.hidden = NO;
		} else {
			[headerView.additionalInfoLabel removeFromSuperview];
			headerView.headerLabelCenterYAlignmentConstraint.constant = 0.0;
		}
	}
	
	return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	id<ChallengeDayDataProtocol> dayForCell = [[self.selectedChallenge daysListOfChallenge] objectAtIndex:indexPath.item];
	
	ChallengeDetailsCollectionViewCell *selectedCell = (ChallengeDetailsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
	
	if (!selectedCell.underlyingViewRevealed) {
		[self performSegueWithIdentifier:THVShowChallengeDayDetails sender:dayForCell];
	} else {
		ChallengeDayAttempt *challengeDayAttempt = (ChallengeDayAttempt *)dayForCell;
		challengeDayAttempt.completed = [NSNumber numberWithBool:![challengeDayAttempt isCompleted]];
		challengeDayAttempt.completionDate = [challengeDayAttempt isCompleted] ? [NSDate date] : nil;
		[challengeDayAttempt.exerciseListOfDay makeObjectsPerformSelector:@selector(setCompleted:) withObject:[NSNumber numberWithBool:[challengeDayAttempt isCompleted]]];
		[challengeDayAttempt.exerciseListOfDay makeObjectsPerformSelector:@selector(setCompletionDate:) withObject:[challengeDayAttempt isCompleted] ? [NSDate date] : nil];
		
		NSError *error = nil;
		if (![((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext save:&error]) {
			NSLog(@"Could not mark challenge day attempt as completed!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
		
		[challengeDayAttempt.challengeAttempt scheduleNextNotification];
		[collectionView reloadItemsAtIndexPaths:@[indexPath]];
	}
}

- (void)markAsCompletedNotificationReceived:(NSNotification *)notification {
	[self.collectionView reloadData];
}

@end
