//
//  BNRDatePickerViewController.m
//  Homepwner
//
//  Created by Alex Keyes on 3/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDatePickerViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDatePickerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.datePicker setDate:self.item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //"save" changes to item
    self.item.dateCreated = self.datePicker.date;
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = item.itemName;
}




@end
