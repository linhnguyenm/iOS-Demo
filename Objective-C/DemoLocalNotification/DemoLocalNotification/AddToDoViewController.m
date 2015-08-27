//
//  AddToDoViewController.m
//  DemoLocalNotification
//
//  Created by Linh Nguyen on 5/15/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _itemText.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    [_itemText resignFirstResponder];
    //Get the current date on data piker
    NSDate *pickerDate = [_datePicker date];
    
    //Schedule the notification
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = _itemText.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    localNotification.soundName = @"sound.mp3";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    NSLog(@"%lu", (unsigned long)[[[UIApplication sharedApplication] scheduledLocalNotifications] count]);	
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil];
    //[self.navigationController popViewControllerAnimated:YES];
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_itemText resignFirstResponder];
    return YES;
}
@end
