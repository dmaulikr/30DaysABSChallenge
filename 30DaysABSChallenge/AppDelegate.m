//
//  AppDelegate.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "AppDelegate.h"
#import "DatabaseInitializer.h"
#import "LocalNotificationsManager.h"
#import "ChallengeAttempt.h"
#import "ChallengeDayAttempt.h"
#import "ChallengeDetailsViewController.h"
#import "ChallengeDayDetailViewController.h"
#import "Commons.h"

NSString *const THVStoryboardSceneIdChallengeDetails = @"challengeDetailsScene";
NSString *const THVStoryboardSceneIdChallengeDayDetails = @"challengeDayDetails";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"_0DaysABSChallenge.sqlite"];
	if (![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]]) {
		[DatabaseInitializer initializeDatabaseWithMOC:[self managedObjectContext]];
	}
	
	[[LocalNotificationsManager sharedInstance] registerUserInteractionTypesAndCategoriesAndActionableNotificationTypes];
	
	if ([launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey]) {
		UILocalNotification *notif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
		[self handleShowChallengeDayWithNotification:notif];
	}
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	// Saves changes in the application's managed object context before the application terminates.
	[self saveContext];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
	
	AppDelegate __block *this = self;
	UILocalNotification __block *localNotif = notification;
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Reminder" message:notification.alertBody preferredStyle:UIAlertControllerStyleActionSheet];
	UIAlertAction *showChallengeDayAction = [UIAlertAction actionWithTitle:@"Show" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[this handleShowChallengeDayWithNotification:localNotif];
	}];
	UIAlertAction *markChallengeDayAsCompletedAction = [UIAlertAction actionWithTitle:@"Mark as completed" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
		[this handleMarkChallengeDayAsCompletedWithNotification:localNotif];
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
		[this handleCancelPopupWithNotification:localNotif];
	}];
	
	[alert addAction:showChallengeDayAction];
	[alert addAction:markChallengeDayAsCompletedAction];
	[alert addAction:cancelAction];
	
	if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
		[((UINavigationController *)self.window.rootViewController).visibleViewController presentViewController:alert animated:YES completion:nil];
	}
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler {
	
	if ([identifier isEqualToString:THVNotificationActionShow]) {
		[self handleShowChallengeDayWithNotification:notification];
	} else if ([identifier isEqualToString:THVNotificationActionMarkAsCompleted]) {
		[self handleMarkChallengeDayAsCompletedWithNotification:notification];
	}
	
	completionHandler();
	
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "mob.learning.thv.30DaysABSChallenge._0DaysABSChallenge" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"_0DaysABSChallenge" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"_0DaysABSChallenge.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
	
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - helper methods
- (void)handleShowChallengeDayWithNotification:(UILocalNotification *)notif {
	if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
		ChallengeAttempt *challengeAttempt = [self getChallengeAttemptFromNotification:notif];
		ChallengeDayAttempt *challengeDayAttempt = [self getChallengeDayAttemptFromNotification:notif];
		
		if (![challengeDayAttempt isCompleted]) {
			UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
			UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
			
			ChallengeDetailsViewController *challengeDetailsVC = [storyboard instantiateViewControllerWithIdentifier:THVStoryboardSceneIdChallengeDetails];
			challengeDetailsVC.selectedChallenge = challengeAttempt;
			
			ChallengeDayDetailViewController *challengeDayDetailsVC = [storyboard instantiateViewControllerWithIdentifier:THVStoryboardSceneIdChallengeDayDetails];
			challengeDayDetailsVC.selectedChallangeDay = challengeDayAttempt;
			challengeDayDetailsVC.challangeName = challengeAttempt.challengeName;
			
			[navController popToRootViewControllerAnimated:NO];
			[navController pushViewController:challengeDetailsVC animated:NO];
			[navController pushViewController:challengeDayDetailsVC animated:YES];
			
			[challengeAttempt scheduleNextNotification];
		}
	}
	
}

- (void)handleMarkChallengeDayAsCompletedWithNotification:(UILocalNotification *)notif {
	ChallengeAttempt *challengeAttempt = [self getChallengeAttemptFromNotification:notif];
	ChallengeDayAttempt *challengeDayAttempt = [self getChallengeDayAttemptFromNotification:notif];
	
	if (![challengeDayAttempt isCompleted]) {
		challengeDayAttempt.completed = [NSNumber numberWithBool:YES];
		challengeDayAttempt.completionDate = [NSDate date];
		[challengeDayAttempt.exerciseListOfDay makeObjectsPerformSelector:@selector(setCompleted:) withObject:[NSNumber numberWithBool:YES]];
		[challengeDayAttempt.exerciseListOfDay makeObjectsPerformSelector:@selector(setCompletionDate:) withObject:[NSDate date]];
		
		NSError *error = nil;
		if (![self.managedObjectContext save:&error]) {
			NSLog(@"Could not mark challenge day attempt as completed!\n%@\n%@", error.localizedDescription, error.userInfo);
		}
		
		[challengeAttempt scheduleNextNotification];
		
		[[NSNotificationCenter defaultCenter] postNotificationName:THVMarkAsCompletedNotificationName object:challengeDayAttempt];
	}
}

- (void)handleCancelPopupWithNotification:(UILocalNotification *)notif {
	ChallengeAttempt *challengeAttempt = [self getChallengeAttemptFromNotification:notif];
	ChallengeDayAttempt *challengeDayAttempt = [self getChallengeDayAttemptFromNotification:notif];
	if (![challengeDayAttempt isCompleted]) {
		[challengeAttempt scheduleNextNotification];
	}
}

- (ChallengeAttempt *)getChallengeAttemptFromNotification:(UILocalNotification *)notif {
	return [self.managedObjectContext objectWithID:[self.persistentStoreCoordinator managedObjectIDForURIRepresentation:[NSURL URLWithString:[notif.userInfo objectForKey:THVNotificationUserInfoChallengeAttemptURIRepresentationId]]]];
}

- (ChallengeDayAttempt *)getChallengeDayAttemptFromNotification:(UILocalNotification *)notif {
	return [self.managedObjectContext objectWithID:[self.persistentStoreCoordinator managedObjectIDForURIRepresentation:[NSURL URLWithString:[notif.userInfo objectForKey:THVNotificationUserInfoChallengeDayAttemptURIRepresentationId]]]];
}

@end
