//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Alex Keyes on 3/8/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    //call the superclass' desginated initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        for (int i = 0; i < 5; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
         numberOfRowsInSection:(NSInteger)section
{
    NSArray* allItems = [[BNRItemStore sharedStore] allItems];
    int countOver50 = 0;
    int countUpTo50 = 0;
    
    for (BNRItem *item in allItems){
        if (item.valueInDollars > 50){
            countOver50++;
        }
    }
    
    countUpTo50 = [allItems count] - countOver50;
    
//    NSLog(@"%@ %d %d", allItems, countOver50, countUpTo50);
//    NSLog(@"%ld", (long)section);
    
    if (section == 0){
        return countOver50;
    }
    
    return countUpTo50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    //set the text on the cell with the description of the item that is at the nth index of items, where n = row this cell will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    int countOver50 = 0;
    int countUpTo50 = 0;
    for (int i = 0; i < [items count]; i++){
        if (((BNRItem *) items[i]).valueInDollars > 50){
            countOver50++;
            if (indexPath.section == 0 && indexPath.row == countOver50 - 1){
                item = items[i];
                break;
            }
        } else {
            countUpTo50++;
            if (indexPath.section == 1 && indexPath.row == countUpTo50 - 1){
                item = items[i];
                break;
            }
        }
    }
    
    cell.textLabel.text = [item description];
    
    return cell;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
