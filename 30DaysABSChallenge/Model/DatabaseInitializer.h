//
//  DatabaseInitializer.h
//  30DaysABSChallenge
//
//  Created by KRKT on 27/05/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseInitializer : NSObject

+ (BOOL)initializeDatabaseWithMOC:(NSManagedObjectContext *)moc;

@end
