//
//  Checkbox.h
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckboxDelegate.h"

@interface Checkbox : UIControl

@property (nonatomic, getter=isChecked) BOOL checked;
@property (weak, nonatomic) id<CheckboxDelegate> delegate;

- (void)updateLayersVisibility;

@end
