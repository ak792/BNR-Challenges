//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Alex Keyes on 3/7/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        //set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //create a UIImage from a file
        //this will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    
    return self;
}


- (void)loadView
{
    //create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    //set it as *the* view of this view controller
    self.view = backgroundView;
}

- (void)viewDidLoad
{
    //always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}


@end
