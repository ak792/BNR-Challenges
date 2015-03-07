//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Alex Keyes on 3/6/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //all BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    //figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //the largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    //configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    //draw the line
    [path stroke];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    [[UIColor blueColor] setFill];
    
    UIBezierPath *triangPath = [[UIBezierPath alloc] init];
    [triangPath moveToPoint:CGPointMake(bounds.origin.x + bounds.size.width/2, bounds.origin.y)];
    [triangPath addLineToPoint:CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height)];
    [triangPath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, bounds.origin.y + bounds.size.height)];
    [triangPath closePath];
    [triangPath fill];
    
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {0.0, 1.0, 0.0, 1.0, //start red
        1.0, 1.0, 0.0, 1.0}; //end yellow
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(bounds.origin.x + bounds.size.width/2, bounds.origin.y);
    CGPoint endPoint = CGPointMake(bounds.origin.x + bounds.size.width/2, bounds.origin.y + bounds.size.height);
    
    CGContextSaveGState(currentContext);
    [triangPath addClip];
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGContextRestoreGState(currentContext);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:rect];
    
    CGContextRestoreGState(currentContext);
}


@end
