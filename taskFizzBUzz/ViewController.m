//
//  ViewController.m
//  taskFizzBUzz
//
//  Created by Yu Ma on 3/23/16.
//  Copyright © 2016 Yu Ma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger selectedTab = [defaults integerForKey:kSelectedTabDefaultsKey];
    UITabBarItem *item = [self.TabBar.items objectAtIndex:selectedTab];
    [self.TabBar setSelectedItem:item];
    if (selectedTab == 0) {
        self.TextTapbar.hidden = NO;
        self.TableView.hidden = YES;
    }else{
        self.TextTapbar.hidden = YES;
        self.TableView.hidden = NO;
    }
    
   
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger tabIndex = [tabBar.items indexOfObject:item];
    [defaults setInteger:tabIndex forKey:kSelectedTabDefaultsKey];
    
    NSLog(@"tap index %lu", (unsigned long)tabIndex);
   
    if (tabIndex == 1) {
        NSLog(@"tap bar 1");
        self.TextTapbar.hidden = YES;
        self.TableView.hidden = NO;
    }else{
        self.TextTapbar.hidden = NO;
        self.TableView.hidden = YES;
        NSLog(@"tap bar 2");
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.

    return 1000;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    NSString *info; // = [NSString stringWithFormat: @"%ld", (long)indexPath.row];//indexPath.row %3 == 0&&indexPath.row %5 == 0
    
    NSInteger tab;
    
    if ((indexPath.row +1) %3 == 0 && (indexPath.row +1) %5 == 0) {
        tab = 0;
    }else if ((indexPath.row +1) %5 == 0){
        tab = 1;
    }else if((indexPath.row +1) %3 == 0 ){
        tab = 2;
    }else{
        tab = 3;
    }
    
    //NSLog(@"kkkkkkkk  %@", tab);
    switch (tab) {
        case 0:
            info = @"FizzBuzz";
            break;
        case 1:
            info = @"Buzz";
            break;
        case 2:
            info = @"Fizz";
            
            break;
        case 3:
            info =[NSString stringWithFormat: @"%ld", ((long)indexPath.row +1)];
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text=info;
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=[UIColor blackColor];
    // [emailsavename addObject:modelemail.EmailAddress];
    return cell;

}



@end
