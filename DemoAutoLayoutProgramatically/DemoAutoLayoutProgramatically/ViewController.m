//
//  ViewController.m
//  DemoAutoLayoutProgramatically
//
//  Created by Linh Nguyen on 7/27/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *superView = self.view;
    //Adding Label
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    myLabel.text = @"Hello";
    
    //Adding Button
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setTitle:@"My Button" forState:UIControlStateNormal];
    [myButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [superView addSubview:myLabel];
    [superView addSubview:myButton];
    
    //Adding constraint for myLabel center in vertical
    NSLayoutConstraint *myConstraint = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:2.0 constant:-50];
    [superView addConstraint:myConstraint];
    
    
    //Adding constraint for myLabel center in horizontal
   myConstraint  = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [superView addConstraint:myConstraint];
    
    //Adding constraint for myLabel spacing with botton 20pt
    myConstraint  = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeBottomMargin  relatedBy:NSLayoutRelationLessThanOrEqual toItem:superView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:20];
    //Add constraint for myButton in the left of myLabel
    myConstraint = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:myLabel attribute:NSLayoutAttributeTrailing  multiplier:1.0 constant:30];
    [superView addConstraint:myConstraint];
    
    //Add constraint for myButton in the same line with myLabel
    myConstraint = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:myLabel attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:0];
    //[superView addConstraint:myConstraint];
    
    //[self addAdBanner];

}
-(void)addAdBanner{
    bannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [bannerView setBackgroundColor:[UIColor clearColor]];
    bannerView.delegate = self;
    [self.view addSubview:bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark AdBannerView Delegate
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad loaded");
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad will load");
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"error %@",[error localizedDescription]);
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad did finish");
}
@end
