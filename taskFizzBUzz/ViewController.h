//
//  ViewController.h
//  taskFizzBUzz
//
//  Created by Yu Ma on 3/23/16.
//  Copyright © 2016 Yu Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITabBarDelegate>

#define kSelectedTabDefaultsKey @"Selected Tab"
enum {
    kByFirstPage,
    kByTableView,
};





@property (weak, nonatomic) IBOutlet UITextField *TextTapbar;
@property (weak, nonatomic) IBOutlet UITabBar *TabBar;
@property (weak, nonatomic) IBOutlet UITableView *TableView;


@end

