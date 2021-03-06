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
// @property (nonatomic, strong) NSArray *listOfElements;
@property (nonatomic, strong) NSMutableArray *listOfElements;
@property (nonatomic, readonly) UINib *intelligentCellNib;
@property (nonatomic, retain) NSIndexPath *expandedCellIndexPath;
@property (nonatomic) CGFloat expandedCellHeight;
@property (weak, nonatomic) IBOutlet UIButton *add_btn;
- (IBAction)btn_add:(id)sender;
@end

@implementation ViewController
@synthesize intelligentCellNib = intelligentCellNib_;
@synthesize expandedCellHeight = expandedCellHeight_;
@synthesize expandedCellIndexPath = expandedCellIndexPath_;
BOOL *imgSelected;
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

/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self.table_view deselectRowAtIndexPath:self.table_view.indexPathForSelectedRow animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:NO];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:NO];
}
*/
 

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void) loadTableView{
    
    _table_view.delegate = self;
    _table_view.dataSource = self;
    self.table_view.estimatedRowHeight = 80;
    self.table_view.rowHeight = UITableViewAutomaticDimension;
    
    [self.table_view setNeedsLayout];
    [self.table_view layoutIfNeeded];
    
    self.table_view.contentInset = UIEdgeInsetsMake(20, 0, 0, 0) ;// Status bar inset
    
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
    
    static NSString *CellIdentifier = @"Cell_Id";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

   //  TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_Id"];
    
    if (cell==nil)
    {
    
       //  [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell_Id"];
    //     cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_Id"];
        
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
        cell.lbl_name.text = [[_listOfElements objectAtIndex:indexPath.row] name];
        cell.lbl_address.text = [[_listOfElements objectAtIndex:indexPath.row] deliver_address];
        cell.lbl_phone.text = [[_listOfElements objectAtIndex:indexPath.row] phone];
    
        if ([self.expandedCellIndexPath isEqual:indexPath]) {
                cell.radiobutton.image = [UIImage imageNamed:@"Radiobutton-choice.png"];

        //  cellHeight = self.expandedCellHeight;
        }else{
                cell.radiobutton.image = [UIImage imageNamed:@"Radio_Button-128.png"];
        }

   
       //  cell.radiobutton.image = [UIImage imageNamed:@"Radiobutton-choice.png"];
        
        //  cell.radiobutton.image = [UIImage imageNamed:@"Radiobutton-choice.png"];
        

 //    cell.selectionStyle = UITableViewCellSelectionStyleNone;


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
//    else{
//        
//        }
    return cellHeight;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.selectedIndexPath = indexPath;
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationNone];
//    TableViewCell *cell = [self tableView:tableView
//                                           cellForRowAtIndexPath:indexPath];
//   
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//
////    NSString *selected = [_products objectAtIndex:[self getRealIndexFromIndexPath:indexPath]];
////    NSLog(@"%@", selected);
// 
// [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}




- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TableViewCell * cell = (TableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
//    if(!cell.selected){
//      //   [cell.radiobutton setImage:[UIImage imageNamed:@"Radiobutton-choice.png"]];
//        // [cell.radiobutton setImage:[UIImage imageNamed:@"Radiobutton-choice.png"]];
//        [cell.radiobutton setImage:[UIImage imageNamed:@"Radio_Button-128.png"]];
//        NSLog(@"Normal Button");
//        
//    }
    
         [tableView deselectRowAtIndexPath:indexPath animated:NO];
         [tableView reloadData];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //if user taps the expanded cell, just make it unexpanded
    if ([self.expandedCellIndexPath isEqual:indexPath])
        self.expandedCellIndexPath = nil;
    else {
                self.expandedCellIndexPath = indexPath;
        //get the pointer to the cell which was tapped
        TableViewCell *cell = (TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        
        CGSize maximumSize = CGSizeMake(cell.btn_deliver_address.bounds.size.width, NSIntegerMax);
        //this method returns the expected size of the description label with respect to the amount
        //of text it contains
   
        CGSize expectedSize = [cell.lbl_phone.text sizeWithFont:cell.lbl_phone.font constrainedToSize:maximumSize lineBreakMode:cell.lbl_phone.lineBreakMode];
        //this defines the height of expanded cell adding the delta between current
        //label height and expected height to  cell content view height.
        self.expandedCellHeight =  cell.contentView.bounds.size.height + cell.lbl_phone.bounds.size.height + expectedSize.height+100;
      //   [cell setSelected:YES animated:YES];
        
    }
 ///       [tableView deselectRowAtIndexPath:indexPath animated:NO];
        //this asks tableview to redraw cells
        //actually it invokes reload of cell just if it's height was changed
        //and animates the resize of the cell
        //   [tableView deselectRowAtIndexPath:[self.table_view indexPathForSelectedRow] animated:NO];
   
    
      // [self.table_view beginUpdates];
          [tableView reloadData];
      //  [self.table_view endUpdates];
      //  [self animate];
}


#pragma mark - Load TableView


-(void) loadDataTableView{
    
    CustomClass *cus1 = [CustomClass new];
    //  TableViewCell *cell = [table_view cellForRowAtIndexPath:path];
    
    cus1.name = @" John Doe";
    cus1.deliver_address = @"459D #6A, New University Avenue Rd,.. ";
    cus1.phone = @"Phone 12345667 ";
    cus1.imageV = [UIImage imageNamed:@"Radio_Button-128.png"];
    //  cus1.imageV1= [UIImage imageNamed:@"Radiobutton-choice.png"];
    //  NSArray *list = [[NSArray alloc] initWithObjects:cus1,cus1,nil];
    //
    //  _listOfElements = [NSArray arrayWithObjects:additem,nil];
    //
    _listOfElements = [[NSMutableArray alloc] init];
    
    _listOfElements = [[NSMutableArray alloc] initWithObjects:cus1,cus1, nil];
    [_table_view reloadData];
}

- (IBAction)btn_add:(id)sender {
    
    [self loadTableView];
    CustomClass *cus2 = [CustomClass new];
    //  TableViewCell *cell = [table_view cellForRowAtIndexPth:path];
    cus2.name = @" John Doe";
    cus2.deliver_address = @"459D #6A, New University Avenue Rd,.. ";
    cus2.phone = @"Phone 12345667 ";
    cus2.imageV = [UIImage imageNamed:@"Radio_Button-128.png"];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    [temp addObject:cus2];
    [temp addObjectsFromArray:_listOfElements];
    
  //   temp = [[NSArray alloc] initWithObjects:cus2, nil];
     _listOfElements = temp;
    
    [_table_view reloadData];
    
    
}
//- (void)animate
//{
//    [[self.table_view visibleCells] enumerateObjectsUsingBlock:^(UITableViewCell *cell, NSUInteger idx, BOOL *stop) {
//        [cell setFrame:CGRectMake(0, cell.frame.origin.x, cell.frame.size.width, cell.frame.size.height)];
//        [UIView animateWithDuration:0.2 animations:^{
//            [cell setFrame:CGRectMake(320, cell.frame.origin.x, cell.frame.size.width, cell.frame.size.height)];
//        }];
//    }];
//}

- (IBAction)del_btn:(id)sender {
    
}

- (IBAction)edit_btn:(id)sender {
}
@end
