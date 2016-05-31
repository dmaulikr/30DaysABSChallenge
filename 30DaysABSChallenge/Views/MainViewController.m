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

NSString *const THVMyChallengesTableViewCellId = @"THVMyChallengesTableViewCellId";

@interface MainViewController ()

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSFetchRequest *fetchRequest;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (self.tableView.contentSize.height > self.tableView.frame.size.height) {
		self.tableView.scrollEnabled = YES;
	} else {
		self.tableView.scrollEnabled = NO;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view helper methods
- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	id<ChallengeDataProtocol> challengeAttemptForRow = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	cell.textLabel.text = [challengeAttemptForRow challengeName];
	if ([challengeAttemptForRow respondsToSelector:@selector(challengeStartDate)]) {
		cell.detailTextLabel.text = [NSString stringWithFormat:@"Started at: %@", [[Commons challengeDayDateFormatter] stringFromDate:[challengeAttemptForRow challengeStartDate]]];
	}
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.fetchedResultsController.sections[section] objects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:THVMyChallengesTableViewCellId];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:THVMyChallengesTableViewCellId];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
	}
	
	[self configureCell:cell forRowAtIndexPath:indexPath];
	
	return cell;
}

#pragma mark - NSFetchedResultsControllerDelegate methods
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView reloadData];
}

#pragma mark - unwind
- (IBAction)unwindToMain:(UIStoryboardSegue *)segue {
}

#pragma mark - lazy initializares
- (NSFetchedResultsController *)fetchedResultsController {
	if (!_fetchedResultsController) {
		_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext sectionNameKeyPath:nil cacheName:nil];
		
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
		_fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
	}
	
	return _fetchRequest;
}

@end
