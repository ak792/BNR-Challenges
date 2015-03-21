//
//  BNRLine.h
//  TouchTracker
//
//  Created by Alex Keyes on 3/20/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

//model

@interface BNRLine : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic) int lineWidth;

@end
