//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Alex Keyes on 3/8/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    //do i need to create a sharedStore?
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

//if a programmer calls [[BNRItemStore alloc] init], let him know
//the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                        reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

//here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}




@end
