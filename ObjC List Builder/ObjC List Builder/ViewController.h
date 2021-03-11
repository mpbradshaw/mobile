//
//  ViewController.h
//  ObjC List Builder
//
//  Created by Matt Bradshaw on 3/10/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *itemTable;
@property (nonatomic, strong) IBOutlet UITableView *priceTable;
@property (nonatomic, strong) IBOutlet UILabel *price;
@property (nonatomic, strong) IBOutlet UITextField *itemText;
@property (nonatomic, strong) IBOutlet UITextField *priceText;
@property (nonatomic, strong) IBOutlet UIButton *enter;

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *prices;

@end

