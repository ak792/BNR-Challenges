//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Alex Keyes on 3/7/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) BNRHypnosisView *backgroundView;

@end

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
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    
    //create a view
    self.backgroundView = [[BNRHypnosisView alloc] init];
    
    [scrollView addSubview:self.backgroundView];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    //setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [self.backgroundView addSubview:textField];
    
    //set it as *the* view of this view controller
    self.view = scrollView;
}

- (void)viewDidLoad
{
    //always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        //configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor redColor];
        messageLabel.text = message;
        
        //This method resizes the label, which will be relative
        //to the text that it is displaying
        [messageLabel sizeToFit];
        
        //get a random x value that fits within the hypnosis view's width
        int width = (int) (self.backgroundView.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        //get a random y value that fits within the hypnosis view's height
        int height = (int) (self.backgroundView.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //add the label to the hierarchy
        [self.backgroundView addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}


@end
