//
//  ViewController.m
//  UsingStoreProduct
//
//  Created by pandazheng on 10/28/15.
//  Copyright © 2015 pandazheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize indicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化一个按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"前往寻艺App Store" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0.0, 0.0, 200.0, 44.0)];
    [button setCenter:self.view.center];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(openAppStore:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) openAppStore: (id) sender {
    [self showIndicator];
    //初始化Product View Controller
    SKStoreProductViewController *storeProductViewController = [[SKStoreProductViewController alloc] init];
    //配置View Controller
    [storeProductViewController setDelegate:self];
    [storeProductViewController loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"685836302"} completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error %@ with User Info %@",error,[error userInfo]);
        }
        else {
            [self hideIndicator];
            [self presentViewController:storeProductViewController animated:YES completion:nil];
        }
    }];
}

- (void) productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) showIndicator {
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:indicatorView];
    [indicatorView sizeToFit];
    [indicatorView startAnimating];
    indicatorView.center = self.view.center;
}

- (void) hideIndicator {
    [indicatorView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
