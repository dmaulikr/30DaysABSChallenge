//
//  MainViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "MainViewController.h"
#import "ChallengeDataProtocol.h"
#import "ChallengeAttempt.h"
#import "Commons.h"
#import "ChallengeDetailsViewController.h"
#import "LocalNotificationsManager.h"

NSString *const THVMyChallengesTableViewCellId = @"THVMyChallengesTableViewCellId";
NSString *const THVShowChallengeAttempDetailsSegueId = @"showChallengeAttemptDetails";

@interface MainViewController ()

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSFetchRequest *fetchRequest;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupPlaceholderLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
	if (self.tableView.contentSize.height > self.tableView.frame.size.height + self.tableView.contentOffset.y) {
		self.tableView.scrollEnabled = YES;
	} else {
		self.tableView.scrollEnabled = NO;
	}
}

- (void)setupPlaceholderLabel {
	if (self.fetchedResultsController.fetchedObjects.count > 0) {
		self.placeholderLabel.hidden = YES;
		self.tableView.hidden = NO;
	} else {
		self.placeholderLabel.hidden = NO;
		self.tableView.hidden = YES;
	}
}

#pragma mark - segue methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVShowChallengeAttempDetailsSegueId]) {
		if ([sender conformsToProtocol:@protocol(ChallengeDataProtocol)]) {
			ChallengeDetailsViewController *destinationVC = segue.destinationViewController;
			destinationVC.selectedChallenge = sender;
		}
	}
}

#pragma mark - table view helper methods
- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	id<ChallengeDataProtocol> challengeAttemptForRow = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	cell.textLabel.text = [challengeAttemptForRow challengeName];
	
	NSMutableString *detailTextLabelText = [NSMutableString string];
	if ([challengeAttemptForRow respondsToSelector:@selector(challengeStartDate)]) {
		[detailTextLabelText appendFormat:@"Started at: %@", [[Commons challengeDayDateFormatter] stringFromDate:[challengeAttemptForRow challengeStartDate]]];
	}
	if ([challengeAttemptForRow respondsToSelector:@selector(isReminderActive)] &&
		[challengeAttemptForRow respondsToSelector:@selector(challengeReminderTime)]) {
		
		if ([challengeAttemptForRow isReminderActive]) {
			[detailTextLabelText appendString:detailTextLabelText.length > 0 ? @", " : @""];
			[detailTextLabelText appendFormat:@"Reminder time: %@", [challengeAttemptForRow challengeReminderTime]];
		}
	}
	if ([challengeAttemptForRow respondsToSelector:@selector(isDelayed)] && [challengeAttemptForRow isDelayed]) {
		cell.backgroundColor = [UIColor colorWithRed:THVDelayedColorR green:THVDelayedColorG blue:THVDelayedColorB alpha:THVDelayedColorA];
	} else if ([challengeAttemptForRow respondsToSelector:@selector(isChallengeDayPendingCompletion)] && [challengeAttemptForRow isChallengeDayPendingCompletion]) {
		cell.backgroundColor = [UIColor colorWithRed:THVPendingColorR green:THVPendingColorG blue:THVPendingColorB alpha:THVPendingColorA];
	} else {
		cell.backgroundColor = [UIColor whiteColor];
	}
	cell.detailTextLabel.text = detailTextLabelText;
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.fetchedResultsController.sections[section] objects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:THVMyChallengesTableViewCellId];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:THVMyChallengesTableViewCellId];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	[self configureCell:cell forRowAtIndexPath:indexPath];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ChallengeAttempt *selectedChallenge = [self.fetchedResultsController objectAtIndexPath:indexPath];
	[self performSegueWithIdentifier:THVShowChallengeAttempDetailsSegueId sender:selectedChallenge];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [self.fetchedResultsController.sections[section] indexTitle];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		ChallengeAttempt *challengeAttempt = [self.fetchedResultsController objectAtIndexPath:indexPath];
		[[LocalNotificationsManager sharedInstance] cancelScheduledNotificationForChallengeAttemptURI:[[challengeAttempt objectID] URIRepresentation]];
		
		NSManagedObjectContext *moc = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
		
		[moc deleteObject:challengeAttempt];
		NSError *error = nil;
		if (![moc save:&error]) {
			NSLog(@"Could not delete ChallengeAttempt!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
		
	}
}

#pragma mark - NSFetchedResultsControllerDelegate methods
- (nullable NSString *)controller:(NSFetchedResultsController *)controller sectionIndexTitleForSectionName:(NSString *)sectionName {
	NSNumber *stateNumber = [[Commons challengeAttemptStateNumberFormatter] numberFromString:sectionName];
	if (stateNumber) {
		switch ([stateNumber integerValue]) {
			case THVChallengeAttemptStateActive:
				return @"Active challanges";
				break;
			case THVChallengeAttemptStateCompleted:
				return @"Completed challanges";
				break;
		}
	}
	
	return nil;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
		case NSFetchedResultsChangeMove:
		case NSFetchedResultsChangeUpdate:
			break;
	}
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(nullable NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(nullable NSIndexPath *)newIndexPath {
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
		case NSFetchedResultsChangeUpdate:
			[self configureCell:[self.tableView cellForRowAtIndexPath:indexPath] forRowAtIndexPath:indexPath];
			break;
		case NSFetchedResultsChangeMove:
			[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
			[self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView endUpdates];
	[self.tableView reloadData];
	[self setupPlaceholderLabel];
}

#pragma mark - unwind
- (IBAction)unwindToMain:(UIStoryboardSegue *)segue {
}

#pragma mark - lazy initializares
- (NSFetchedResultsController *)fetchedResultsController {
	if (!_fetchedResultsController) {
		_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext sectionNameKeyPath:@"state" cacheName:nil];
		
		_fetchedResultsController.delegate = self;
		
		NSError *error = nil;
		if (![_fetchedResultsController performFetch:&error]) {
			NSLog(@"Could not fetch challenge attempts!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
	}
	
	return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest {
	if (!_fetchRequest) {
		_fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[ChallengeAttempt entityName]];
		_fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"state" ascending:YES], [NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
	}
	
	return _fetchRequest;
}

@end
