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
        NSLog(@"add na");
    }
    else {
        [prices addObject:insertedPrice];
        float floatPrice = [insertedPrice floatValue];
        totalPrice = totalPrice + floatPrice;
        NSString *newTotal = [[NSNumber numberWithFloat:totalPrice] stringValue];
        [price setText:newTotal];
        NSLog(@"add the price");

    }
    
    [itemText setText:@""];
    [priceText setText:@""];
    
    [itemTable reloadData];
    [priceTable reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == itemTable) {
        [items removeObjectAtIndex:indexPath.row];
    } else if(tableView == priceTable) {
        NSString *priceToRemove = [prices objectAtIndex:indexPath.row];
        [prices removeObjectAtIndex:indexPath.row];
        float floatPrice = [priceToRemove floatValue];
        totalPrice = totalPrice - floatPrice;
        NSString *newTotal = [[NSNumber numberWithFloat:totalPrice] stringValue];
        [price setText:newTotal];
    } else {
        NSLog(@"Error");
    }
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
