//
//  BNRCrosshairView.m
//  Homepwner
//
//  Created by Alex Keyes on 3/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRCrosshairView.h"

@interface BNRCrosshairView ()

@property (strong, nonatomic) UIColor *crosshairColor;

@end

@implementation BNRCrosshairView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSLog(@"in init");
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.crosshairColor = [UIColor lightGrayColor];
    }
    
    return self;
}

//implement drawRect
- (void)drawRect:(CGRect)rect
{
    NSLog(@"in drawRect");
    CGRect bounds = self.bounds;
    
    //figure out center of bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + (bounds.size.height + 44) / 2.0;
    
    float lineLen = bounds.size.width / 10;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(center.x - lineLen / 2.0, center.y)];
    [path addLineToPoint:CGPointMake(center.x + lineLen / 2.0, center.y)];
    
    [path moveToPoint:CGPointMake(center.x, center.y - lineLen / 2.0)];
    [path addLineToPoint:CGPointMake(center.x, center.y + lineLen / 2.0)];
    
    path.lineWidth = 5;
    
    [self.crosshairColor setStroke];
    
    //draw the line
    [path stroke];
}



@end
