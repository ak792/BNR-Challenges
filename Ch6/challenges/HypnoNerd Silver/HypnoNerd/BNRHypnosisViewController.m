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
    
    NSArray *colors = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *colorPicker = [[UISegmentedControl alloc] initWithItems:colors];
    
    colorPicker.frame = CGRectMake(35, 200, 250, 50);
    [colorPicker addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    
    [backgroundView addSubview:colorPicker];
    
    //set it as *the* view of this view controller
    self.view = backgroundView;
}

- (void)changeColor:(UISegmentedControl *)segment
{
    
    UIColor *selectedColor = [[UIColor alloc] init];
    if (segment.selectedSegmentIndex == 0){
        selectedColor = [UIColor redColor];
    } else if (segment.selectedSegmentIndex == 1){
        selectedColor = [UIColor greenColor];
    } else if (segment.selectedSegmentIndex == 2){
        selectedColor = [UIColor blueColor];
    }
    
    BNRHypnosisView *backgroundView = (BNRHypnosisView *) self.view;
    backgroundView.circleColor = selectedColor;
}


- (void)viewDidLoad
{
    //always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}


@end
