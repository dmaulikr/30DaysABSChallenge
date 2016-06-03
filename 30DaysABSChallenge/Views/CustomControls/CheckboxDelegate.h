//
//  CheckboxDelegate.h
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CheckboxDelegate <NSObject>

@required
- (void)checkboxWasChecked:(BOOL)checked;

@end
