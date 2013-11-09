//
//  DVPHoledView.m
//  HoledView
//
//  Created by Ignazio Calò on 31/10/13.
//  Copyright (c) 2013 it.ignazioc. All rights reserved.
//

#import "DVPHoledView.h"

@interface DVPHoledView ()


@property (nonatomic, strong) NSMutableArray *rectHoles;
@property (nonatomic, strong) NSMutableArray *ellipseHoles;

@end

@implementation DVPHoledView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
		[self setBackgroundColor:[UIColor clearColor]];
        self.fillColor = [UIColor redColor];
        self.rectHoles = [NSMutableArray array];
        self.ellipseHoles = [NSMutableArray array];
        
    }
    return self;
}

- (void)createHoleInRect:(CGRect )rect {
    NSValue *tmp = [NSValue valueWithCGRect:rect];
    [self.rectHoles addObject:tmp];
}


- (void)createEllipseInRect:(CGRect )rect {
    NSValue *tmp = [NSValue valueWithCGRect:rect];
    [self.ellipseHoles addObject:tmp];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (! [backgroundColor isEqual:[UIColor clearColor]]) {
        NSAssert(FALSE, @"Background color can be only transparent. Please use the \"fillColor\" property");
    }else {
        [super setBackgroundColor:backgroundColor];
    }
    
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextSetFillColorWithColor( ctx, self.fillColor.CGColor );
    CGContextFillRect( ctx, rect );
    
    
    
    CGContextSetBlendMode(ctx, kCGBlendModeDestinationOut);
    CGContextSetFillColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    [self.rectHoles enumerateObjectsUsingBlock:^(NSValue *rect, NSUInteger idx, BOOL *stop){
        CGRect spotRect = [rect CGRectValue];
        CGContextFillRect(ctx, spotRect);
    }];
    
    [self.ellipseHoles enumerateObjectsUsingBlock:^(NSValue *rect, NSUInteger idx, BOOL *stop){
        CGRect spotRect = [rect CGRectValue];
        CGContextFillEllipseInRect(ctx, spotRect);
    }];
    
    
    
    CGContextRestoreGState(ctx);
}



//- (UIImage *)bho {
//    UIGraphicsBeginImageContext(CGSizeMake(150, 300));
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
//    
//    CGRect r = CGRectMake(0, 0, 150, 300);
//    CGContextFillRect(ctx, r);
//    
//    
//    UIImage *bar = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return bar;
//}
//
//- (void)drawRect:(CGRect)rect {
//    
//	CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor( context, [UIColor redColor].CGColor );
//    CGContextFillRect( context, rect );
//    [[self bho] drawAtPoint:CGPointMake(50, 50) blendMode:kCGBlendModeDestinationOut alpha:1];
//
//	
//}

@end
