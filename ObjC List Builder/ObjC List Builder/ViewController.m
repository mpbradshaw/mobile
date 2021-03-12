//
//  ViewController.m
//  ObjC List Builder
//
//  Created by Matt Bradshaw on 3/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize itemTable, priceTable, items, prices, price, itemText, priceText, enter;
float totalPrice = 0.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [itemTable setDelegate:self];
    [itemTable setDataSource:self];
    [priceTable setDelegate:self];
    [priceTable setDataSource:self];
    
    items = [[NSMutableArray alloc] init];
    prices = [[NSMutableArray alloc] init];
    
    [items addObject:@"Items"];
    [prices addObject:@"Prices"];
    
    [itemTable reloadData];
    [priceTable reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if(tableView == itemTable) {
        [[cell textLabel] setText:[items objectAtIndex:[indexPath row]]];
    } else if(tableView == priceTable) {
        [[cell textLabel] setText:[prices objectAtIndex:[indexPath row]]];
    } else {
        NSLog(@"Error");
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (IBAction)addItem:(id)sender {
    NSString *insertedItem = [itemText text];
    NSString *insertedPrice = [priceText text];

    [items addObject:insertedItem];
    
    if([insertedPrice isEqualToString:@""]) {
        [prices addObject:@"N/A"];
    }
    else {
        [prices addObject:insertedPrice];
        float floatPrice = [insertedPrice floatValue];
        totalPrice = totalPrice + floatPrice;
        NSString *newTotal = [[NSNumber numberWithFloat:totalPrice] stringValue];
        [price setText:newTotal];
    }
    
    [itemText setText:@""];
    [priceText setText:@""];
    
    [itemTable reloadData];
    [priceTable reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [items removeObjectAtIndex:indexPath.row];
    
    NSString *priceToRemove = [prices objectAtIndex:indexPath.row];
    [prices removeObjectAtIndex:indexPath.row];
    float floatPrice = [priceToRemove floatValue];
    totalPrice = totalPrice - floatPrice;
    NSString *newTotal2 = [[NSNumber numberWithFloat:totalPrice] stringValue];

    bool empty = true;
    for(NSString *s in prices) {
        if([s isEqualToString:@"N/A"] || [s isEqualToString:@"Prices"]) {
            
        }
        else {
            empty = false;
            break;
        }
    }
    
    if (empty == true) {
        [price setText:@"0.00"];
    } else {
        [price setText:newTotal2];
    }

    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [itemTable deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [priceTable deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];

}

@end
