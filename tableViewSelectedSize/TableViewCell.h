//
//  TableViewCell.h
//  tableViewSelectedSize
//
//  Created by Revo Tech on 6/10/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_address;
@property (weak, nonatomic) IBOutlet UILabel *lbl_phone;
@property (weak, nonatomic) IBOutlet UIImageView *radiobutton;
@property (weak, nonatomic) IBOutlet UIButton *btn_deliver_address;
@property (weak, nonatomic) IBOutlet UIButton *btn_edit;
@property (weak, nonatomic) IBOutlet UIButton *btn_delete;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
- (IBAction)del_btn:(id)sender;

- (IBAction)edit_btn:(id)sender;

@end
