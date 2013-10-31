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
	DVPHoledView *holedView =[[DVPHoledView alloc] initWithFrame:self.view.bounds];
    [holedView setFillColor:[UIColor blackColor]];
    [holedView setAlpha:0.8];
    
    for (int i = 0; i < 5; i++ ) {
        for (int j = 0; j < 10; j++ ) {
            [holedView createHoleInRect:CGRectMake(i * 68, j * 64, 30, 30)];
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
