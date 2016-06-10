//
//  ViewController.m
//  tableViewSelectedSize
//
//  Created by Revo Tech on 6/10/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "CustomClass.h"

@interface ViewController () < UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property (nonatomic, strong) NSArray *listOfElements;
@property (nonatomic, readonly) UINib *intelligentCellNib;
@property (nonatomic, retain) NSIndexPath *expandedCellIndexPath;
@property (nonatomic) CGFloat expandedCellHeight;

@end

@implementation ViewController
@synthesize intelligentCellNib = intelligentCellNib_;
@synthesize expandedCellHeight = expandedCellHeight_;
@synthesize expandedCellIndexPath = expandedCellIndexPath_;
//
//- (void)dealloc {
//    [intelligentCellNib_ release];
//    self.expandedCellIndexPath = nil;
//    [super dealloc];
//}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadTableView];
    [self loadDataTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void) loadTableView{
    
    _table_view.delegate = self;
    _table_view.dataSource = self;
    self.table_view.estimatedRowHeight = 80;
    self.table_view.rowHeight = UITableViewAutomaticDimension;
    
    [self.table_view setNeedsLayout];
    [self.table_view layoutIfNeeded];
    
    self.table_view.contentInset = UIEdgeInsetsMake(20, 0, 0, 0) ;// Status bar inset
    
}
-(void) loadDataTableView{
    
    CustomClass *cus1 = [CustomClass new];
    cus1.name = @" John Doe";
    cus1.deliver_address = @"459D #6A, New University Avenue Rd,.. ";
    cus1.phone = @"Phone 12345667 ";
    cus1.imageV = [UIImage imageNamed:@"Radio_Button-128.png"];
    // cus1.imageV1= [UIImage imageNamed:@"Radiobutton-choice.png"];
    
    cus1.name = @" John Doe";
    cus1.deliver_address = @"459D #6A, New University Avenue Rd,.. ";
    cus1.phone = @"Phone 12345667 ";
    cus1.imageV = [UIImage imageNamed:@"Radio_Button-128.png"];
    
    
   //  cus1.imageV1= [UIImage imageNamed:@"Radiobutton-choice.png"];
   //    cus1.deliverbtn = [UIColor]
    
    
    
 
    _listOfElements = [[NSArray alloc] initWithObjects:cus1,cus1, nil];
    [_table_view reloadData];
}

#pragma TableView Control

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  _listOfElements.count;
    
}




-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
// static NSString *CellIdentifier = @"ICIntelligentCell";
    
   //TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_Id"];
    
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell_Id"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_Id"];
    }
    cell.lbl_name.text = [[_listOfElements objectAtIndex:indexPath.row] name];
    cell.lbl_address.text = [[_listOfElements objectAtIndex:indexPath.row] deliver_address];
    cell.lbl_phone.text = [[_listOfElements objectAtIndex:indexPath.row] phone];
    cell.radiobutton.image = [[_listOfElements objectAtIndex:indexPath.row] imageV];
    
/*
    
    if ([indexPath compare:self.selectedIndexPath] == NSOrderedSame) {
        // Create your custom cell here and return it.
   
        
            cell.lbl_name.text = [[_listOfElements objectAtIndex:indexPath.row] name];
            cell.lbl_address.text = [[_listOfElements objectAtIndex:indexPath.row] deliver_address];
            cell.lbl_phone.text = [[_listOfElements objectAtIndex:indexPath.row] phone];
            cell.radiobutton.image = [UIImage imageNamed:@"Radiobutton-choice.png"];
        
          //  cell.radiobutton.image = [UIImage imageNamed:@"Radiobutton-choice.png"];
        
        
    }
    else {
        // Should create a normal cell and return it.
        
     
        
      
    }
        */ 
 
    return cell;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //standard height is default for each cell
    CGFloat cellHeight = 100.0f;
    if ([self.expandedCellIndexPath isEqual:indexPath]) {
        cellHeight = 180.0f;
        //  cellHeight = self.expandedCellHeight;
    }
    return cellHeight;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    switch (section) {
//            //poets
//        case 0:
//            return @"Poets";
//            break;
//            
//        default:
//            return @"";
//            break;
//    }
//}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationNone];
    TableViewCell *cell = [self tableView:tableView
                                           cellForRowAtIndexPath:indexPath];
   
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

//    NSString *selected = [_products objectAtIndex:[self getRealIndexFromIndexPath:indexPath]];
//    NSLog(@"%@", selected);
 
 [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if ( flag == 1 && indexPath.row == index )
        return 50;
    else
        return 30;

    //    if (indexPath.row == 0) {
//        return 100;
//    }
//    else {
//        return 180;
//    }
//    UITableViewCell *cell = [self tableView:tableView
//                      cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
}

 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if user taps the expanded cell, just make it unexpanded
    if ([self.expandedCellIndexPath isEqual:indexPath])
        self.expandedCellIndexPath = nil;
    else {
        //make cell with this indexpath  expanded
        self.expandedCellIndexPath = indexPath;
        //get the pointer to the cell which was tapped
        TableViewCell *cell = (TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        //define the maximum size for description label as
        //CGSize with width of description label and infinite height
        
        
        CGSize maximumSize = CGSizeMake(cell.btn_deliver_address.bounds.size.width, NSIntegerMax);
        //this method returns the expected size of the description label with respect to the amount
        //of text it contains
   
        CGSize expectedSize = [cell.lbl_phone.text sizeWithFont:cell.lbl_phone.font constrainedToSize:maximumSize lineBreakMode:cell.lbl_phone.lineBreakMode];
        //this defines the height of expanded cell adding the delta between current
        //label height and expected height to  cell content view height.
        self.expandedCellHeight =  cell.contentView.bounds.size.height + cell.lbl_phone.bounds.size.height + expectedSize.height+100;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Cell: %@", cell);
    
    // cell.imageView.image = [UIImage imageNamed:@"Radiobutton-choice.png"];
    [cell setSelected:NO animated:YES];
        //this asks tableview to redraw cells
    //actually it invokes reload of cell just if it's height was changed
    //and animates the resize of the cell
    [self.table_view beginUpdates];
    [self.table_view endUpdates];
}

#pragma mark -
#pragma mark lazy getters
//- (UINib *)intelligentCellNib
//{
//    if (!intelligentCellNib_) {
//        intelligentCellNib_ = [[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] retain];
//    }
//    
//    return intelligentCellNib_;
//}

@end
