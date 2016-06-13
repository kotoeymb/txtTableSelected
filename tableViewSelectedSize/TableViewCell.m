//
//  TableViewCell.m
//  tableViewSelectedSize
//
//  Created by Revo Tech on 6/10/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize lbl_name;
@synthesize lbl_address;
@synthesize lbl_phone;
@synthesize btn_deliver_address;
@synthesize btn_edit;
@synthesize btn_delete;
@synthesize radiobutton;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:NO];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
     
    }
    return self;
}


@end
