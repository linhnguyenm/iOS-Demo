//
//  DetailViewController.h
//  DemoSplitView
//
//  Created by Linh Nguyen on 6/15/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

