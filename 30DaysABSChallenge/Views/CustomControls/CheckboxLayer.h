//
//  CheckboxLayer.h
//  30DaysABSChallenge
//
//  Created by KRKT on 03/06/16.
//  Copyright © 2016 tahavath. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CheckboxLayer : CALayer

@property (nonatomic) UIColor *completedColor;
@property (nonatomic) UIColor *notCompletedColor;

@property (nonatomic) CGRect checkboxCircleFrame;
@property (nonatomic) UIBezierPath *circlePath;
@property (nonatomic) CGFloat circlePathSize;

@property (nonatomic) UIBezierPath *checkMarkPath;
@property (nonatomic) CGFloat checkMarkPathBackgroundSize;
@property (nonatomic) CGFloat checkMarkPathSize;

@end
