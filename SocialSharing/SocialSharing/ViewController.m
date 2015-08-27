//
//  ViewController.m
//  SocialSharing
//
//  Created by Nguyen Mai Linh on 3/16/15.
//  Copyright (c) 2015 Nguyen Mai Linh. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postTwitter:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *tweetView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetView setInitialText:@"ABC"];
        [self presentViewController:tweetView animated:YES completion:nil];
    }
}

- (IBAction)postFacebook:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbView addURL:[NSURL URLWithString:@"http://hcmup.edu.vn"]];
        [fbView addImage:[UIImage imageNamed:@"ball.jpg"]];
        [self presentViewController:fbView animated:YES completion:nil];
    }
}
@end
