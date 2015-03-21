//
//  BNRLine.m
//  TouchTracker
//
//  Created by Alex Keyes on 3/20/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRLine.h"

@interface BNRLine() <NSCoding>

@end

@implementation BNRLine

-(void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self forKey:@"line"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self = [decoder decodeObjectForKey:@"line"];
    }
    return self;
}

@end
