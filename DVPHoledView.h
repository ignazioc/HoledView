//
//  DVPHoledView.h
//  HoledView
//
//  Created by Ignazio Calò on 31/10/13.
//  Copyright (c) 2013 it.ignazioc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DVPHoledView : UIView


@property (nonatomic, strong) UIColor *fillColor;


- (void)createHoleInRect:(CGRect )rect;
@end
