//
//  ListPhotoViewController.h
//  GCD_PhotoLoading
//
//  Created by Linh Nguyen on 6/3/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListPhotoViewController : UITableViewController
@property (nonatomic, strong)NSDictionary *photosDict;
@property (nonatomic, strong)NSMutableArray *photosArray;
@end
