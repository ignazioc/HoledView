//
//  DVPViewController.m
//  HoledView
//
//  Created by Ignazio Calò on 31/10/13.
//  Copyright (c) 2013 it.ignazioc. All rights reserved.
//

#import "DVPViewController.h"
#import "DVPHoledView.h"

@interface DVPViewController ()

@end

@implementation DVPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	DVPHoledView *holedView =[[DVPHoledView alloc] initWithFrame:CGRectMake(0, 50, 320, 668)];
    [holedView setFillColor:[UIColor blackColor]];
    [holedView setAlpha:0.8];
    
    for (int i = 0; i < 4; i++ ) {
        for (int j = 0; j < 4; j++ ) {
            [holedView createHoleInRect:CGRectMake(i * 50 +(i * 20) + 30, j * 50 + ( j * 20) + 10, 50 , 50)];
        }
    }
    
    for (int i = 0; i < 4; i++ ) {
        for (int j = 0; j < 3; j++ ) {
            [holedView createEllipseInRect:CGRectMake(i * 50 +(i * 20) + 30, j * 50 + ( j * 20) + 280, 50 , 50)];
        }
    }
    
    
    
    [self.view addSubview:holedView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
