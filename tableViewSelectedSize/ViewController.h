//
//  ViewController.h
//  tableViewSelectedSize
//
//  Created by Revo Tech on 6/10/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
- (IBAction)del_btn:(id)sender;
- (IBAction)edit_btn:(id)sender;

// @property (strong, nonatomic) TableViewCell *taskListViewController;
@end

