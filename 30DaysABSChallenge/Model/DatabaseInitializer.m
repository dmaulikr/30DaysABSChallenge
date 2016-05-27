//
//  DatabaseInitializer.m
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import "DatabaseInitializer.h"
#import "Challenge.h"
#import "ChallengeDay.h"
#import "Exercise.h"

NSString *const THVExerciseNameSitUps = @"sit-ups";
NSString *const THVExerciseNameCrunches = @"crunches";
NSString *const THVExerciseNameLegRaises = @"leg raises";
NSString *const THVExerciseNamePlank = @"plank";

@implementation DatabaseInitializer

+ (BOOL)initializeDatabaseWithMOC:(NSManagedObjectContext *)moc {

#pragma mark - Challenge Days with exercises
#pragma mark challenge day 1
	// create challange day 1 with exercises
	ChallengeDay *day01 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day01.dayNumber = @(1);
	day01.challengeDayId = @(1);
	day01.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day01Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise01.amount = @(15);
	day01Exercise01.name = THVExerciseNameSitUps;
	day01Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day01Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise02.amount = @(5);
	day01Exercise02.name = THVExerciseNameCrunches;
	day01Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day01Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise03.amount = @(5);
	day01Exercise03.name = THVExerciseNameLegRaises;
	day01Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day01Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise04.amount = @(10);
	day01Exercise04.name = THVExerciseNamePlank;
	day01Exercise04.type = @(THVExerciseTypeTime);
	
	[day01 addExerciseListObject:day01Exercise01];
	[day01 addExerciseListObject:day01Exercise02];
	[day01 addExerciseListObject:day01Exercise03];
	[day01 addExerciseListObject:day01Exercise04];
	
#pragma mark challenge day 2
	// create challange day 2 with exercises
	ChallengeDay *day02 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day01.dayNumber = @(2);
	day01.challengeDayId = @(2);
	day01.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day02Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise01.amount = @(20);
	day02Exercise01.name = THVExerciseNameSitUps;
	day02Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day02Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise02.amount = @(8);
	day02Exercise02.name = THVExerciseNameCrunches;
	day02Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day02Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise03.amount = @(8);
	day02Exercise03.name = THVExerciseNameLegRaises;
	day02Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day02Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise04.amount = @(12);
	day02Exercise04.name = THVExerciseNamePlank;
	day02Exercise04.type = @(THVExerciseTypeTime);
	
	[day02 addExerciseListObject:day02Exercise01];
	[day02 addExerciseListObject:day02Exercise02];
	[day02 addExerciseListObject:day02Exercise03];
	[day02 addExerciseListObject:day02Exercise04];
	
#pragma mark challenge day 3
	// create challange day 3 with exercises
	ChallengeDay *day03 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day03.dayNumber = @(3);
	day03.challengeDayId = @(3);
	day03.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day03Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise01.amount = @(25);
	day03Exercise01.name = THVExerciseNameSitUps;
	day03Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day03Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise02.amount = @(10);
	day03Exercise02.name = THVExerciseNameCrunches;
	day03Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day03Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise03.amount = @(10);
	day03Exercise03.name = THVExerciseNameLegRaises;
	day03Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day03Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise04.amount = @(15);
	day03Exercise04.name = THVExerciseNamePlank;
	day03Exercise04.type = @(THVExerciseTypeTime);
	
	[day03 addExerciseListObject:day03Exercise01];
	[day03 addExerciseListObject:day03Exercise02];
	[day03 addExerciseListObject:day03Exercise03];
	[day03 addExerciseListObject:day03Exercise04];
	
#pragma mark challenge day 4
	// create challange day 4 with exercises
	ChallengeDay *day04 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day04.dayNumber = @(4);
	day04.challengeDayId = @(4);
	day04.type = @(THVChallengeDayTypeRest);
	
#pragma mark challenge day 5
	// create challange day 5 with exercises
	ChallengeDay *day05 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day05.dayNumber = @(5);
	day05.challengeDayId = @(5);
	day05.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day05Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise01.amount = @(30);
	day05Exercise01.name = THVExerciseNameSitUps;
	day05Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day05Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise02.amount = @(12);
	day05Exercise02.name = THVExerciseNameCrunches;
	day05Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day05Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise03.amount = @(12);
	day05Exercise03.name = THVExerciseNameLegRaises;
	day05Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day05Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise04.amount = @(20);
	day05Exercise04.name = THVExerciseNamePlank;
	day05Exercise04.type = @(THVExerciseTypeTime);
	
	[day05 addExerciseListObject:day05Exercise01];
	[day05 addExerciseListObject:day05Exercise02];
	[day05 addExerciseListObject:day05Exercise03];
	[day05 addExerciseListObject:day05Exercise04];
	
#pragma mark challenge day 6
	// create challange day 6 with exercises
	ChallengeDay *day06 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day06.dayNumber = @(6);
	day06.challengeDayId = @(6);
	day06.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day06Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise01.amount = @(35);
	day06Exercise01.name = THVExerciseNameSitUps;
	day06Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day06Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise02.amount = @(15);
	day06Exercise02.name = THVExerciseNameCrunches;
	day06Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day06Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise03.amount = @(15);
	day06Exercise03.name = THVExerciseNameLegRaises;
	day06Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day06Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise04.amount = @(25);
	day06Exercise04.name = THVExerciseNamePlank;
	day06Exercise04.type = @(THVExerciseTypeTime);
	
	[day06 addExerciseListObject:day06Exercise01];
	[day06 addExerciseListObject:day06Exercise02];
	[day06 addExerciseListObject:day06Exercise03];
	[day06 addExerciseListObject:day06Exercise04];
	
#pragma mark challenge day 7
	// create challange day 7 with exercises
	ChallengeDay *day07 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day07.dayNumber = @(7);
	day07.challengeDayId = @(7);
	day07.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day07Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise01.amount = @(40);
	day07Exercise01.name = THVExerciseNameSitUps;
	day07Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day07Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise02.amount = @(20);
	day07Exercise02.name = THVExerciseNameCrunches;
	day07Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day07Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise03.amount = @(20);
	day07Exercise03.name = THVExerciseNameLegRaises;
	day07Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day07Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise04.amount = @(30);
	day07Exercise04.name = THVExerciseNamePlank;
	day07Exercise04.type = @(THVExerciseTypeTime);
	
	[day07 addExerciseListObject:day07Exercise01];
	[day07 addExerciseListObject:day07Exercise02];
	[day07 addExerciseListObject:day07Exercise03];
	[day07 addExerciseListObject:day07Exercise04];
	
#pragma mark challenge day 8
	// create challange day 8 with exercises
	ChallengeDay *day08 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day08.dayNumber = @(8);
	day08.challengeDayId = @(8);
	day08.type = @(THVChallengeDayTypeRest);
	
#pragma mark challenge day 9
	// create challange day 9 with exercises
	ChallengeDay *day09 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day09.dayNumber = @(9);
	day09.challengeDayId = @(9);
	day09.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day09Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise01.amount = @(45);
	day09Exercise01.name = THVExerciseNameSitUps;
	day09Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day09Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise02.amount = @(30);
	day09Exercise02.name = THVExerciseNameCrunches;
	day09Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day09Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise03.amount = @(30);
	day09Exercise03.name = THVExerciseNameLegRaises;
	day09Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day09Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise04.amount = @(35);
	day09Exercise04.name = THVExerciseNamePlank;
	day09Exercise04.type = @(THVExerciseTypeTime);
	
	[day09 addExerciseListObject:day09Exercise01];
	[day09 addExerciseListObject:day09Exercise02];
	[day09 addExerciseListObject:day09Exercise03];
	[day09 addExerciseListObject:day09Exercise04];
	
#pragma mark challenge day 10
	// create challange day 10 with exercises
	ChallengeDay *day10 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day10.dayNumber = @(10);
	day10.challengeDayId = @(10);
	day10.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day10Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise01.amount = @(50);
	day10Exercise01.name = THVExerciseNameSitUps;
	day10Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day10Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise02.amount = @(50);
	day10Exercise02.name = THVExerciseNameCrunches;
	day10Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day10Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise03.amount = @(30);
	day10Exercise03.name = THVExerciseNameLegRaises;
	day10Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day10Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise04.amount = @(38);
	day10Exercise04.name = THVExerciseNamePlank;
	day10Exercise04.type = @(THVExerciseTypeTime);
	
	[day10 addExerciseListObject:day10Exercise01];
	[day10 addExerciseListObject:day10Exercise02];
	[day10 addExerciseListObject:day10Exercise03];
	[day10 addExerciseListObject:day10Exercise04];
	
#pragma mark challenge day 11
	// create challange day 11 with exercises
	ChallengeDay *day11 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day11.dayNumber = @(11);
	day11.challengeDayId = @(11);
	day11.type = @(THVChallengeDayTypeWorkout);
	
	Exercise *day11Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise01.amount = @(55);
	day11Exercise01.name = THVExerciseNameSitUps;
	day11Exercise01.type = @(THVExerciseTypeRepetition);
	
	Exercise *day11Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise02.amount = @(65);
	day11Exercise02.name = THVExerciseNameCrunches;
	day11Exercise02.type = @(THVExerciseTypeRepetition);
	
	Exercise *day11Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise03.amount = @(33);
	day11Exercise03.name = THVExerciseNameLegRaises;
	day11Exercise03.type = @(THVExerciseTypeRepetition);
	
	Exercise *day11Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise04.amount = @(42);
	day11Exercise04.name = THVExerciseNamePlank;
	day11Exercise04.type = @(THVExerciseTypeTime);
	
	[day11 addExerciseListObject:day11Exercise01];
	[day11 addExerciseListObject:day11Exercise02];
	[day11 addExerciseListObject:day11Exercise03];
	[day11 addExerciseListObject:day11Exercise04];
	
#pragma mark challenge day 12
	// create challange day 12 with exercises
	ChallengeDay *day12 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day12.dayNumber = @(12);
	day12.challengeDayId = @(12);
	day12.type = @(THVChallengeDayTypeRest);
	
#pragma mark - Challange
	// create challange entity
	Challenge *absChallange = [NSEntityDescription insertNewObjectForEntityForName:[Challenge entityName] inManagedObjectContext:moc];
	absChallange.challengeId = @(1);
	absChallange.name = @"ABS Challenge";
	absChallange.numberOfDays = @(30);
	
	
	
	return NO;
}

@end





