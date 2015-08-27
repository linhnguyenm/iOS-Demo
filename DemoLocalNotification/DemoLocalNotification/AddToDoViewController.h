//
//  AddToDoViewController.h
//  DemoLocalNotification
//
//  Created by Linh Nguyen on 5/15/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *itemText;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)save:(id)sender;

@end
