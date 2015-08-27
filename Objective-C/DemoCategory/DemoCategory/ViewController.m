//
//  ViewController.m
//  DemoCategory
//
//  Created by Linh Nguyen on 6/6/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "NSString+RemoveNums.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *stringWithNums = @"ABC 123";
    NSLog( @"stringWithNums: %@",stringWithNums);
    stringWithNums = [stringWithNums removeNumberFromString:stringWithNums];
    NSLog(@"string without nums: %@",stringWithNums);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
