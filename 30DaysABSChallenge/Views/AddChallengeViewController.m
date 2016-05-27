//
//  AddChallengeViewController.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "AddChallengeViewController.h"
#import "ChallengeDetailsViewController.h"
#import "ChosenChallengeConfigurationViewController.h"
#import "Challenge.h"

NSString *const THVAddChallengeTableViewCellId = @"THVAddChallengeTableViewCellId";
NSString *const THVShowChallengeDetailsSegueName = @"showChallengeDetails";
NSString *const THVShowChosenChallengeDetailsSegueName = @"chosenScreenFromChallengeList";

@interface AddChallengeViewController ()

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSFetchRequest *fetchRequest;

@property (nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation AddChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segue methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:THVShowChallengeDetailsSegueName]) {
		if ([sender isKindOfClass:[Challenge class]]) {
			ChallengeDetailsViewController *destinationVC = [segue destinationViewController];
			destinationVC.selectedChallenge = sender;
		}
	} else if ([segue.identifier isEqualToString:THVShowChosenChallengeDetailsSegueName]) {
		ChosenChallengeConfigurationViewController *destinationVC = [segue destinationViewController];
		destinationVC.selectedChallenge = [self.fetchedResultsController objectAtIndexPath:self.selectedIndexPath];
	}
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(nonnull NSIndexPath *)indexPath {
	[self performSegueWithIdentifier:THVShowChallengeDetailsSegueName sender:[self.fetchedResultsController objectAtIndexPath:indexPath]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	self.selectedIndexPath = indexPath;
	self.chooseButton.enabled = YES;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	self.selectedIndexPath = nil;
	self.chooseButton.enabled = NO;
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[self.fetchedResultsController.sections objectAtIndex:section] objects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:THVAddChallengeTableViewCellId];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:THVAddChallengeTableViewCellId];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
	
	[self configureCell:cell forRowAtIndexPath:indexPath];
	
	return cell;
}

#pragma mark - table view helper methods
- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	Challenge *challenge = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	cell.textLabel.text = [challenge name];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Days: %@", [challenge numberOfDays]];
}

#pragma mark - lazy initializers
- (NSFetchedResultsController *)fetchedResultsController {
	if (!_fetchedResultsController) {
		_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext sectionNameKeyPath:nil cacheName:nil];
		
		NSError *error;
		if (![_fetchedResultsController performFetch:&error]) {
			NSLog(@"couldn't preform fetch!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
	}
	
	return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest {
	if (!_fetchRequest) {
		_fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Challenge entityName]];
		_fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"challengeId" ascending:YES]];
	}
	
	return _fetchRequest;
}

- (IBAction)chooseButtonTapped:(id)sender {
}
@end
