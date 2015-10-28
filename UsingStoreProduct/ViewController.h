//
//  ViewController.h
//  UsingStoreProduct
//
//  Created by pandazheng on 10/28/15.
//  Copyright © 2015 pandazheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController <SKStoreProductViewControllerDelegate>


@property (nonatomic) UIActivityIndicatorView *indicatorView;

@end

