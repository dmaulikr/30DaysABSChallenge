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

+ (void)initializeDatabaseWithMOC:(NSManagedObjectContext *)moc {

#pragma mark - ABS Challenge
	
	// create challange entity
	Challenge *absChallange = [NSEntityDescription insertNewObjectForEntityForName:[Challenge entityName] inManagedObjectContext:moc];
	absChallange.challengeId = @(1);
	absChallange.name = @"ABS Challenge";
	absChallange.numberOfDays = @(30);
	
#pragma mark -
#pragma mark challenge day 1
	// create challange day 1 with exercises
	ChallengeDay *day01 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day01.dayNumber = @(1);
	day01.challengeDayId = @(1);
	day01.type = @(THVChallengeDayTypeWorkout);
	day01.challenge = absChallange;
	
	Exercise *day01Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise01.amount = @(15);
	day01Exercise01.name = THVExerciseNameSitUps;
	day01Exercise01.type = @(THVExerciseTypeRepetition);
	day01Exercise01.challengeDay = day01;
	
	Exercise *day01Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise02.amount = @(5);
	day01Exercise02.name = THVExerciseNameCrunches;
	day01Exercise02.type = @(THVExerciseTypeRepetition);
	day01Exercise02.challengeDay = day01;
	
	Exercise *day01Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise03.amount = @(5);
	day01Exercise03.name = THVExerciseNameLegRaises;
	day01Exercise03.type = @(THVExerciseTypeRepetition);
	day01Exercise03.challengeDay = day01;
	
	Exercise *day01Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day01Exercise04.amount = @(10);
	day01Exercise04.name = THVExerciseNamePlank;
	day01Exercise04.type = @(THVExerciseTypeTime);
	day01Exercise04.challengeDay = day01;
	
#pragma mark challenge day 2
	// create challange day 2 with exercises
	ChallengeDay *day02 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day02.dayNumber = @(2);
	day02.challengeDayId = @(2);
	day02.type = @(THVChallengeDayTypeWorkout);
	day02.challenge = absChallange;
	
	Exercise *day02Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise01.amount = @(20);
	day02Exercise01.name = THVExerciseNameSitUps;
	day02Exercise01.type = @(THVExerciseTypeRepetition);
	day02Exercise01.challengeDay = day02;
	
	Exercise *day02Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise02.amount = @(8);
	day02Exercise02.name = THVExerciseNameCrunches;
	day02Exercise02.type = @(THVExerciseTypeRepetition);
	day02Exercise02.challengeDay = day02;
	
	Exercise *day02Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise03.amount = @(8);
	day02Exercise03.name = THVExerciseNameLegRaises;
	day02Exercise03.type = @(THVExerciseTypeRepetition);
	day02Exercise03.challengeDay = day02;
	
	Exercise *day02Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day02Exercise04.amount = @(12);
	day02Exercise04.name = THVExerciseNamePlank;
	day02Exercise04.type = @(THVExerciseTypeTime);
	day02Exercise04.challengeDay = day02;
	
#pragma mark challenge day 3
	// create challange day 3 with exercises
	ChallengeDay *day03 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day03.dayNumber = @(3);
	day03.challengeDayId = @(3);
	day03.type = @(THVChallengeDayTypeWorkout);
	day03.challenge = absChallange;
	
	Exercise *day03Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise01.amount = @(25);
	day03Exercise01.name = THVExerciseNameSitUps;
	day03Exercise01.type = @(THVExerciseTypeRepetition);
	day03Exercise01.challengeDay = day03;
	
	Exercise *day03Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise02.amount = @(10);
	day03Exercise02.name = THVExerciseNameCrunches;
	day03Exercise02.type = @(THVExerciseTypeRepetition);
	day03Exercise02.challengeDay = day03;
	
	Exercise *day03Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise03.amount = @(10);
	day03Exercise03.name = THVExerciseNameLegRaises;
	day03Exercise03.type = @(THVExerciseTypeRepetition);
	day03Exercise03.challengeDay = day03;
	
	Exercise *day03Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day03Exercise04.amount = @(15);
	day03Exercise04.name = THVExerciseNamePlank;
	day03Exercise04.type = @(THVExerciseTypeTime);
	day03Exercise04.challengeDay = day03;
	
#pragma mark challenge day 4
	// create challange day 4 with exercises
	ChallengeDay *day04 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day04.dayNumber = @(4);
	day04.challengeDayId = @(4);
	day04.type = @(THVChallengeDayTypeRest);
	day04.challenge = absChallange;
	
#pragma mark challenge day 5
	// create challange day 5 with exercises
	ChallengeDay *day05 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day05.dayNumber = @(5);
	day05.challengeDayId = @(5);
	day05.type = @(THVChallengeDayTypeWorkout);
	day05.challenge = absChallange;
	
	Exercise *day05Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise01.amount = @(30);
	day05Exercise01.name = THVExerciseNameSitUps;
	day05Exercise01.type = @(THVExerciseTypeRepetition);
	day05Exercise01.challengeDay = day05;
	
	Exercise *day05Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise02.amount = @(12);
	day05Exercise02.name = THVExerciseNameCrunches;
	day05Exercise02.type = @(THVExerciseTypeRepetition);
	day05Exercise02.challengeDay = day05;
	
	Exercise *day05Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise03.amount = @(12);
	day05Exercise03.name = THVExerciseNameLegRaises;
	day05Exercise03.type = @(THVExerciseTypeRepetition);
	day05Exercise03.challengeDay = day05;
	
	Exercise *day05Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day05Exercise04.amount = @(20);
	day05Exercise04.name = THVExerciseNamePlank;
	day05Exercise04.type = @(THVExerciseTypeTime);
	day05Exercise04.challengeDay = day05;
	
#pragma mark challenge day 6
	// create challange day 6 with exercises
	ChallengeDay *day06 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day06.dayNumber = @(6);
	day06.challengeDayId = @(6);
	day06.type = @(THVChallengeDayTypeWorkout);
	day06.challenge = absChallange;
	
	Exercise *day06Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise01.amount = @(35);
	day06Exercise01.name = THVExerciseNameSitUps;
	day06Exercise01.type = @(THVExerciseTypeRepetition);
	day06Exercise01.challengeDay = day06;
	
	Exercise *day06Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise02.amount = @(15);
	day06Exercise02.name = THVExerciseNameCrunches;
	day06Exercise02.type = @(THVExerciseTypeRepetition);
	day06Exercise02.challengeDay = day06;
	
	Exercise *day06Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise03.amount = @(15);
	day06Exercise03.name = THVExerciseNameLegRaises;
	day06Exercise03.type = @(THVExerciseTypeRepetition);
	day06Exercise03.challengeDay = day06;
	
	Exercise *day06Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day06Exercise04.amount = @(25);
	day06Exercise04.name = THVExerciseNamePlank;
	day06Exercise04.type = @(THVExerciseTypeTime);
	day06Exercise04.challengeDay = day06;
	
#pragma mark challenge day 7
	// create challange day 7 with exercises
	ChallengeDay *day07 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day07.dayNumber = @(7);
	day07.challengeDayId = @(7);
	day07.type = @(THVChallengeDayTypeWorkout);
	day07.challenge = absChallange;
	
	Exercise *day07Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise01.amount = @(40);
	day07Exercise01.name = THVExerciseNameSitUps;
	day07Exercise01.type = @(THVExerciseTypeRepetition);
	day07Exercise01.challengeDay = day07;
	
	Exercise *day07Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise02.amount = @(20);
	day07Exercise02.name = THVExerciseNameCrunches;
	day07Exercise02.type = @(THVExerciseTypeRepetition);
	day07Exercise02.challengeDay = day07;
	
	Exercise *day07Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise03.amount = @(20);
	day07Exercise03.name = THVExerciseNameLegRaises;
	day07Exercise03.type = @(THVExerciseTypeRepetition);
	day07Exercise03.challengeDay = day07;
	
	Exercise *day07Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day07Exercise04.amount = @(30);
	day07Exercise04.name = THVExerciseNamePlank;
	day07Exercise04.type = @(THVExerciseTypeTime);
	day07Exercise04.challengeDay = day07;
	
#pragma mark challenge day 8
	// create challange day 8 with exercises
	ChallengeDay *day08 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day08.dayNumber = @(8);
	day08.challengeDayId = @(8);
	day08.type = @(THVChallengeDayTypeRest);
	day08.challenge = absChallange;
	
#pragma mark challenge day 9
	// create challange day 9 with exercises
	ChallengeDay *day09 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day09.dayNumber = @(9);
	day09.challengeDayId = @(9);
	day09.type = @(THVChallengeDayTypeWorkout);
	day09.challenge = absChallange;
	
	Exercise *day09Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise01.amount = @(45);
	day09Exercise01.name = THVExerciseNameSitUps;
	day09Exercise01.type = @(THVExerciseTypeRepetition);
	day09Exercise01.challengeDay = day09;
	
	Exercise *day09Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise02.amount = @(30);
	day09Exercise02.name = THVExerciseNameCrunches;
	day09Exercise02.type = @(THVExerciseTypeRepetition);
	day09Exercise02.challengeDay = day09;
	
	Exercise *day09Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise03.amount = @(30);
	day09Exercise03.name = THVExerciseNameLegRaises;
	day09Exercise03.type = @(THVExerciseTypeRepetition);
	day09Exercise03.challengeDay = day09;
	
	Exercise *day09Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day09Exercise04.amount = @(35);
	day09Exercise04.name = THVExerciseNamePlank;
	day09Exercise04.type = @(THVExerciseTypeTime);
	day09Exercise04.challengeDay = day09;
	
#pragma mark challenge day 10
	// create challange day 10 with exercises
	ChallengeDay *day10 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day10.dayNumber = @(10);
	day10.challengeDayId = @(10);
	day10.type = @(THVChallengeDayTypeWorkout);
	day10.challenge = absChallange;
	
	Exercise *day10Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise01.amount = @(50);
	day10Exercise01.name = THVExerciseNameSitUps;
	day10Exercise01.type = @(THVExerciseTypeRepetition);
	day10Exercise01.challengeDay = day10;
	
	Exercise *day10Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise02.amount = @(50);
	day10Exercise02.name = THVExerciseNameCrunches;
	day10Exercise02.type = @(THVExerciseTypeRepetition);
	day10Exercise02.challengeDay = day10;
	
	Exercise *day10Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise03.amount = @(30);
	day10Exercise03.name = THVExerciseNameLegRaises;
	day10Exercise03.type = @(THVExerciseTypeRepetition);
	day10Exercise03.challengeDay = day10;
	
	Exercise *day10Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day10Exercise04.amount = @(38);
	day10Exercise04.name = THVExerciseNamePlank;
	day10Exercise04.type = @(THVExerciseTypeTime);
	day10Exercise04.challengeDay = day10;
	
#pragma mark challenge day 11
	// create challange day 11 with exercises
	ChallengeDay *day11 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day11.dayNumber = @(11);
	day11.challengeDayId = @(11);
	day11.type = @(THVChallengeDayTypeWorkout);
	day11.challenge = absChallange;
	
	Exercise *day11Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise01.amount = @(55);
	day11Exercise01.name = THVExerciseNameSitUps;
	day11Exercise01.type = @(THVExerciseTypeRepetition);
	day11Exercise01.challengeDay = day11;
	
	Exercise *day11Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise02.amount = @(65);
	day11Exercise02.name = THVExerciseNameCrunches;
	day11Exercise02.type = @(THVExerciseTypeRepetition);
	day11Exercise02.challengeDay = day11;
	
	Exercise *day11Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise03.amount = @(33);
	day11Exercise03.name = THVExerciseNameLegRaises;
	day11Exercise03.type = @(THVExerciseTypeRepetition);
	day11Exercise03.challengeDay = day11;
	
	Exercise *day11Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day11Exercise04.amount = @(42);
	day11Exercise04.name = THVExerciseNamePlank;
	day11Exercise04.type = @(THVExerciseTypeTime);
	day11Exercise04.challengeDay = day11;
	
#pragma mark challenge day 12
	// create challange day 12 with exercises
	ChallengeDay *day12 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day12.dayNumber = @(12);
	day12.challengeDayId = @(12);
	day12.type = @(THVChallengeDayTypeRest);
	day12.challenge = absChallange;
	
#pragma mark challenge day 13
	// create challange day 13 with exercises
	ChallengeDay *day13 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day13.dayNumber = @(13);
	day13.challengeDayId = @(13);
	day13.type = @(THVChallengeDayTypeWorkout);
	day13.challenge = absChallange;
	
	Exercise *day13Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day13Exercise01.amount = @(60);
	day13Exercise01.name = THVExerciseNameSitUps;
	day13Exercise01.type = @(THVExerciseTypeRepetition);
	day13Exercise01.challengeDay = day13;
	
	Exercise *day13Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day13Exercise02.amount = @(75);
	day13Exercise02.name = THVExerciseNameCrunches;
	day13Exercise02.type = @(THVExerciseTypeRepetition);
	day13Exercise02.challengeDay = day13;
	
	Exercise *day13Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day13Exercise03.amount = @(40);
	day13Exercise03.name = THVExerciseNameLegRaises;
	day13Exercise03.type = @(THVExerciseTypeRepetition);
	day13Exercise03.challengeDay = day13;
	
	Exercise *day13Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day13Exercise04.amount = @(50);
	day13Exercise04.name = THVExerciseNamePlank;
	day13Exercise04.type = @(THVExerciseTypeTime);
	day13Exercise04.challengeDay = day13;
	
#pragma mark challenge day 14
	// create challange day 14 with exercises
	ChallengeDay *day14 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day14.dayNumber = @(14);
	day14.challengeDayId = @(14);
	day14.type = @(THVChallengeDayTypeWorkout);
	day14.challenge = absChallange;
	
	Exercise *day14Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day14Exercise01.amount = @(65);
	day14Exercise01.name = THVExerciseNameSitUps;
	day14Exercise01.type = @(THVExerciseTypeRepetition);
	day14Exercise01.challengeDay = day14;
	
	Exercise *day14Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day14Exercise02.amount = @(85);
	day14Exercise02.name = THVExerciseNameCrunches;
	day14Exercise02.type = @(THVExerciseTypeRepetition);
	day14Exercise02.challengeDay = day14;
	
	Exercise *day14Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day14Exercise03.amount = @(42);
	day14Exercise03.name = THVExerciseNameLegRaises;
	day14Exercise03.type = @(THVExerciseTypeRepetition);
	day14Exercise03.challengeDay = day14;
	
	Exercise *day14Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day14Exercise04.amount = @(55);
	day14Exercise04.name = THVExerciseNamePlank;
	day14Exercise04.type = @(THVExerciseTypeTime);
	day14Exercise04.challengeDay = day14;
	
#pragma mark challenge day 15
	// create challange day 15 with exercises
	ChallengeDay *day15 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day15.dayNumber = @(15);
	day15.challengeDayId = @(15);
	day15.type = @(THVChallengeDayTypeWorkout);
	day15.challenge = absChallange;
	
	Exercise *day15Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day15Exercise01.amount = @(70);
	day15Exercise01.name = THVExerciseNameSitUps;
	day15Exercise01.type = @(THVExerciseTypeRepetition);
	day15Exercise01.challengeDay = day15;
	
	Exercise *day15Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day15Exercise02.amount = @(90);
	day15Exercise02.name = THVExerciseNameCrunches;
	day15Exercise02.type = @(THVExerciseTypeRepetition);
	day15Exercise02.challengeDay = day15;
	
	Exercise *day15Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day15Exercise03.amount = @(42);
	day15Exercise03.name = THVExerciseNameLegRaises;
	day15Exercise03.type = @(THVExerciseTypeRepetition);
	day15Exercise03.challengeDay = day15;
	
	Exercise *day15Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day15Exercise04.amount = @(60);
	day15Exercise04.name = THVExerciseNamePlank;
	day15Exercise04.type = @(THVExerciseTypeTime);
	day15Exercise04.challengeDay = day15;
	
#pragma mark challenge day 16
	// create challange day 16 with exercises
	ChallengeDay *day16 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day16.dayNumber = @(16);
	day16.challengeDayId = @(16);
	day16.type = @(THVChallengeDayTypeRest);
	day16.challenge = absChallange;
	
#pragma mark challenge day 17
	// create challange day 17 with exercises
	ChallengeDay *day17 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day17.dayNumber = @(17);
	day17.challengeDayId = @(17);
	day17.type = @(THVChallengeDayTypeWorkout);
	day17.challenge = absChallange;
	
	Exercise *day17Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day17Exercise01.amount = @(75);
	day17Exercise01.name = THVExerciseNameSitUps;
	day17Exercise01.type = @(THVExerciseTypeRepetition);
	day17Exercise01.challengeDay = day17;
	
	Exercise *day17Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day17Exercise02.amount = @(100);
	day17Exercise02.name = THVExerciseNameCrunches;
	day17Exercise02.type = @(THVExerciseTypeRepetition);
	day17Exercise02.challengeDay = day17;
	
	Exercise *day17Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day17Exercise03.amount = @(45);
	day17Exercise03.name = THVExerciseNameLegRaises;
	day17Exercise03.type = @(THVExerciseTypeRepetition);
	day17Exercise03.challengeDay = day17;
	
	Exercise *day17Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day17Exercise04.amount = @(65);
	day17Exercise04.name = THVExerciseNamePlank;
	day17Exercise04.type = @(THVExerciseTypeTime);
	day17Exercise04.challengeDay = day17;
	
#pragma mark challenge day 18
	// create challange day 18 with exercises
	ChallengeDay *day18 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day18.dayNumber = @(18);
	day18.challengeDayId = @(18);
	day18.type = @(THVChallengeDayTypeWorkout);
	day18.challenge = absChallange;
	
	Exercise *day18Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day18Exercise01.amount = @(80);
	day18Exercise01.name = THVExerciseNameSitUps;
	day18Exercise01.type = @(THVExerciseTypeRepetition);
	day18Exercise01.challengeDay = day18;
	
	Exercise *day18Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day18Exercise02.amount = @(110);
	day18Exercise02.name = THVExerciseNameCrunches;
	day18Exercise02.type = @(THVExerciseTypeRepetition);
	day18Exercise02.challengeDay = day18;
	
	Exercise *day18Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day18Exercise03.amount = @(48);
	day18Exercise03.name = THVExerciseNameLegRaises;
	day18Exercise03.type = @(THVExerciseTypeRepetition);
	day18Exercise03.challengeDay = day18;
	
	Exercise *day18Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day18Exercise04.amount = @(70);
	day18Exercise04.name = THVExerciseNamePlank;
	day18Exercise04.type = @(THVExerciseTypeTime);
	day18Exercise04.challengeDay = day18;
	
#pragma mark challenge day 19
	// create challange day 19 with exercises
	ChallengeDay *day19 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day19.dayNumber = @(19);
	day19.challengeDayId = @(19);
	day19.type = @(THVChallengeDayTypeWorkout);
	day19.challenge = absChallange;
	
	Exercise *day19Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day19Exercise01.amount = @(85);
	day19Exercise01.name = THVExerciseNameSitUps;
	day19Exercise01.type = @(THVExerciseTypeRepetition);
	day19Exercise01.challengeDay = day19;
	
	Exercise *day19Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day19Exercise02.amount = @(120);
	day19Exercise02.name = THVExerciseNameCrunches;
	day19Exercise02.type = @(THVExerciseTypeRepetition);
	day19Exercise02.challengeDay = day19;
	
	Exercise *day19Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day19Exercise03.amount = @(50);
	day19Exercise03.name = THVExerciseNameLegRaises;
	day19Exercise03.type = @(THVExerciseTypeRepetition);
	day19Exercise03.challengeDay = day19;
	
	Exercise *day19Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day19Exercise04.amount = @(75);
	day19Exercise04.name = THVExerciseNamePlank;
	day19Exercise04.type = @(THVExerciseTypeTime);
	day19Exercise04.challengeDay = day19;
	
#pragma mark challenge day 20
	// create challange day 20 with exercises
	ChallengeDay *day20 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day20.dayNumber = @(20);
	day20.challengeDayId = @(20);
	day20.type = @(THVChallengeDayTypeRest);
	day20.challenge = absChallange;
	
#pragma mark challenge day 21
	// create challange day 21 with exercises
	ChallengeDay *day21 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day21.dayNumber = @(21);
	day21.challengeDayId = @(21);
	day21.type = @(THVChallengeDayTypeWorkout);
	day21.challenge = absChallange;
	
	Exercise *day21Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day21Exercise01.amount = @(90);
	day21Exercise01.name = THVExerciseNameSitUps;
	day21Exercise01.type = @(THVExerciseTypeRepetition);
	day21Exercise01.challengeDay = day21;
	
	Exercise *day21Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day21Exercise02.amount = @(130);
	day21Exercise02.name = THVExerciseNameCrunches;
	day21Exercise02.type = @(THVExerciseTypeRepetition);
	day21Exercise02.challengeDay = day21;
	
	Exercise *day21Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day21Exercise03.amount = @(52);
	day21Exercise03.name = THVExerciseNameLegRaises;
	day21Exercise03.type = @(THVExerciseTypeRepetition);
	day21Exercise03.challengeDay = day21;
	
	Exercise *day21Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day21Exercise04.amount = @(80);
	day21Exercise04.name = THVExerciseNamePlank;
	day21Exercise04.type = @(THVExerciseTypeTime);
	day21Exercise04.challengeDay = day21;
	
#pragma mark challenge day 22
	// create challange day 22 with exercises
	ChallengeDay *day22 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day22.dayNumber = @(22);
	day22.challengeDayId = @(22);
	day22.type = @(THVChallengeDayTypeWorkout);
	day22.challenge = absChallange;
	
	Exercise *day22Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day22Exercise01.amount = @(95);
	day22Exercise01.name = THVExerciseNameSitUps;
	day22Exercise01.type = @(THVExerciseTypeRepetition);
	day22Exercise01.challengeDay = day22;
	
	Exercise *day22Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day22Exercise02.amount = @(140);
	day22Exercise02.name = THVExerciseNameCrunches;
	day22Exercise02.type = @(THVExerciseTypeRepetition);
	day22Exercise02.challengeDay = day22;
	
	Exercise *day22Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day22Exercise03.amount = @(55);
	day22Exercise03.name = THVExerciseNameLegRaises;
	day22Exercise03.type = @(THVExerciseTypeRepetition);
	day22Exercise03.challengeDay = day22;
	
	Exercise *day22Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day22Exercise04.amount = @(85);
	day22Exercise04.name = THVExerciseNamePlank;
	day22Exercise04.type = @(THVExerciseTypeTime);
	day22Exercise04.challengeDay = day22;
	
#pragma mark challenge day 23
	// create challange day 23 with exercises
	ChallengeDay *day23 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day23.dayNumber = @(23);
	day23.challengeDayId = @(23);
	day23.type = @(THVChallengeDayTypeWorkout);
	day23.challenge = absChallange;
	
	Exercise *day23Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day23Exercise01.amount = @(100);
	day23Exercise01.name = THVExerciseNameSitUps;
	day23Exercise01.type = @(THVExerciseTypeRepetition);
	day23Exercise01.challengeDay = day23;
	
	Exercise *day23Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day23Exercise02.amount = @(150);
	day23Exercise02.name = THVExerciseNameCrunches;
	day23Exercise02.type = @(THVExerciseTypeRepetition);
	day23Exercise02.challengeDay = day23;
	
	Exercise *day23Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day23Exercise03.amount = @(58);
	day23Exercise03.name = THVExerciseNameLegRaises;
	day23Exercise03.type = @(THVExerciseTypeRepetition);
	day23Exercise03.challengeDay = day23;
	
	Exercise *day23Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day23Exercise04.amount = @(90);
	day23Exercise04.name = THVExerciseNamePlank;
	day23Exercise04.type = @(THVExerciseTypeTime);
	day23Exercise04.challengeDay = day23;
	
#pragma mark challenge day 24
	// create challange day 24 with exercises
	ChallengeDay *day24 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day24.dayNumber = @(24);
	day24.challengeDayId = @(24);
	day24.type = @(THVChallengeDayTypeRest);
	day24.challenge = absChallange;
	
#pragma mark challenge day 25
	// create challange day 25 with exercises
	ChallengeDay *day25 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day25.dayNumber = @(25);
	day25.challengeDayId = @(25);
	day25.type = @(THVChallengeDayTypeWorkout);
	day25.challenge = absChallange;
	
	Exercise *day25Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day25Exercise01.amount = @(105);
	day25Exercise01.name = THVExerciseNameSitUps;
	day25Exercise01.type = @(THVExerciseTypeRepetition);
	day25Exercise01.challengeDay = day25;
	
	Exercise *day25Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day25Exercise02.amount = @(160);
	day25Exercise02.name = THVExerciseNameCrunches;
	day25Exercise02.type = @(THVExerciseTypeRepetition);
	day25Exercise02.challengeDay = day25;
	
	Exercise *day25Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day25Exercise03.amount = @(60);
	day25Exercise03.name = THVExerciseNameLegRaises;
	day25Exercise03.type = @(THVExerciseTypeRepetition);
	day25Exercise03.challengeDay = day25;
	
	Exercise *day25Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day25Exercise04.amount = @(95);
	day25Exercise04.name = THVExerciseNamePlank;
	day25Exercise04.type = @(THVExerciseTypeTime);
	day25Exercise04.challengeDay = day25;
	
#pragma mark challenge day 26
	// create challange day 26 with exercises
	ChallengeDay *day26 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day26.dayNumber = @(26);
	day26.challengeDayId = @(26);
	day26.type = @(THVChallengeDayTypeWorkout);
	day26.challenge = absChallange;
	
	Exercise *day26Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day26Exercise01.amount = @(110);
	day26Exercise01.name = THVExerciseNameSitUps;
	day26Exercise01.type = @(THVExerciseTypeRepetition);
	day26Exercise01.challengeDay = day26;
	
	Exercise *day26Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day26Exercise02.amount = @(170);
	day26Exercise02.name = THVExerciseNameCrunches;
	day26Exercise02.type = @(THVExerciseTypeRepetition);
	day26Exercise02.challengeDay = day26;
	
	Exercise *day26Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day26Exercise03.amount = @(60);
	day26Exercise03.name = THVExerciseNameLegRaises;
	day26Exercise03.type = @(THVExerciseTypeRepetition);
	day26Exercise03.challengeDay = day26;
	
	Exercise *day26Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day26Exercise04.amount = @(100);
	day26Exercise04.name = THVExerciseNamePlank;
	day26Exercise04.type = @(THVExerciseTypeTime);
	day26Exercise04.challengeDay = day26;
	
#pragma mark challenge day 27
	// create challange day 27 with exercises
	ChallengeDay *day27 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day27.dayNumber = @(27);
	day27.challengeDayId = @(27);
	day27.type = @(THVChallengeDayTypeWorkout);
	day27.challenge = absChallange;
	
	Exercise *day27Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day27Exercise01.amount = @(115);
	day27Exercise01.name = THVExerciseNameSitUps;
	day27Exercise01.type = @(THVExerciseTypeRepetition);
	day27Exercise01.challengeDay = day27;
	
	Exercise *day27Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day27Exercise02.amount = @(180);
	day27Exercise02.name = THVExerciseNameCrunches;
	day27Exercise02.type = @(THVExerciseTypeRepetition);
	day27Exercise02.challengeDay = day27;
	
	Exercise *day27Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day27Exercise03.amount = @(62);
	day27Exercise03.name = THVExerciseNameLegRaises;
	day27Exercise03.type = @(THVExerciseTypeRepetition);
	day27Exercise03.challengeDay = day27;
	
	Exercise *day27Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day27Exercise04.amount = @(110);
	day27Exercise04.name = THVExerciseNamePlank;
	day27Exercise04.type = @(THVExerciseTypeTime);
	day27Exercise04.challengeDay = day27;
	
#pragma mark challenge day 28
	// create challange day 28 with exercises
	ChallengeDay *day28 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day28.dayNumber = @(28);
	day28.challengeDayId = @(28);
	day28.type = @(THVChallengeDayTypeRest);
	day28.challenge = absChallange;
	
#pragma mark challenge day 29
	// create challange day 29 with exercises
	ChallengeDay *day29 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day29.dayNumber = @(29);
	day29.challengeDayId = @(29);
	day29.type = @(THVChallengeDayTypeWorkout);
	day29.challenge = absChallange;
	
	Exercise *day29Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day29Exercise01.amount = @(120);
	day29Exercise01.name = THVExerciseNameSitUps;
	day29Exercise01.type = @(THVExerciseTypeRepetition);
	day29Exercise01.challengeDay = day29;
	
	Exercise *day29Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day29Exercise02.amount = @(190);
	day29Exercise02.name = THVExerciseNameCrunches;
	day29Exercise02.type = @(THVExerciseTypeRepetition);
	day29Exercise02.challengeDay = day29;
	
	Exercise *day29Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day29Exercise03.amount = @(62);
	day29Exercise03.name = THVExerciseNameLegRaises;
	day29Exercise03.type = @(THVExerciseTypeRepetition);
	day29Exercise03.challengeDay = day29;
	
	Exercise *day29Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day29Exercise04.amount = @(115);
	day29Exercise04.name = THVExerciseNamePlank;
	day29Exercise04.type = @(THVExerciseTypeTime);
	day29Exercise04.challengeDay = day29;
	
#pragma mark challenge day 30
	// create challange day 30 with exercises
	ChallengeDay *day30 = [NSEntityDescription insertNewObjectForEntityForName:[ChallengeDay entityName] inManagedObjectContext:moc];
	day30.dayNumber = @(30);
	day30.challengeDayId = @(30);
	day30.type = @(THVChallengeDayTypeWorkout);
	day30.challenge = absChallange;
	
	Exercise *day30Exercise01 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day30Exercise01.amount = @(125);
	day30Exercise01.name = THVExerciseNameSitUps;
	day30Exercise01.type = @(THVExerciseTypeRepetition);
	day30Exercise01.challengeDay = day30;
	
	Exercise *day30Exercise02 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day30Exercise02.amount = @(200);
	day30Exercise02.name = THVExerciseNameCrunches;
	day30Exercise02.type = @(THVExerciseTypeRepetition);
	day30Exercise02.challengeDay = day30;
	
	Exercise *day30Exercise03 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day30Exercise03.amount = @(65);
	day30Exercise03.name = THVExerciseNameLegRaises;
	day30Exercise03.type = @(THVExerciseTypeRepetition);
	day30Exercise03.challengeDay = day30;
	
	Exercise *day30Exercise04 = [NSEntityDescription insertNewObjectForEntityForName:[Exercise entityName] inManagedObjectContext:moc];
	day30Exercise04.amount = @(120);
	day30Exercise04.name = THVExerciseNamePlank;
	day30Exercise04.type = @(THVExerciseTypeTime);
	day30Exercise04.challengeDay = day30;
	
	// save MOC
	NSError *error;
	if (![moc save:&error]) {
		NSLog(@"couldn't save managed context!\n%@\n%@", error.localizedDescription, error.userInfo);
	}
}

@end





