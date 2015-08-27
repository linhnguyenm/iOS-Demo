//
//  MasterViewController.h
//  DemoSplitView
//
//  Created by Linh Nguyen on 6/15/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

