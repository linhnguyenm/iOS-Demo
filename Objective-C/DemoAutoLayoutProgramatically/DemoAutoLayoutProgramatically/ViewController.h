//
//  ViewController.h
//  DemoAutoLayoutProgramatically
//
//  Created by Linh Nguyen on 7/27/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController<ADBannerViewDelegate>
{
    ADBannerView *bannerView;
}


@end

