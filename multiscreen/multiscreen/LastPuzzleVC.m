//
//  LastPuzzleVC.m
//  multiscreen
//
//  Created by Matt Bradshaw on 2/26/21.
//

#import "LastPuzzleVC.h"

@interface LastPuzzleVC ()

@end

@implementation LastPuzzleVC

NSMutableArray *codeEntered;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickedEnterCodeButton:(id)sender {
    NSLog(@"Enter code");
    [codeEntered removeAllObjects];
    codeEntered = [[NSMutableArray alloc] init];
    [codeEntered addObject:@"start"];
}

- (void)goToStart {
    NSLog(@"GoToStart");
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *start = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentModalViewController:start animated:YES];
}

- (IBAction)onePressed:(id)sender {
    NSLog(@"1 Pressed");
    if([codeEntered count] == 2) {
        NSString *firstChar = [codeEntered objectAtIndex:1];
        if([firstChar isEqualToString:@"2"]) {
            [codeEntered addObject:@"1"];
        }
        else {
            [self goToStart];
        }
    }
    else if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)twoPressed:(id)sender {
    NSLog(@"2 Pressed");
    if([codeEntered count] == 1) {
        [codeEntered addObject:@"2"];
    }
    else if([codeEntered count] > 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)threePressed:(id)sender {
    NSLog(@"3 Pressed");
    if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)fourPressed:(id)sender {
    NSLog(@"4 Pressed");
    if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)fivePressed:(id)sender {
    NSLog(@"5 Pressed");
    if([codeEntered count] == 4) {
        NSString *firstChar = [codeEntered objectAtIndex:1];
        NSString *secondChar = [codeEntered objectAtIndex:2];
        NSString *thirdChar = [codeEntered objectAtIndex:3];
        if([firstChar isEqualToString:@"2"] && [secondChar isEqualToString:@"1"] && [thirdChar isEqualToString:@"0"]) {
            [codeEntered addObject:@"5"];
        }
        else {
            [self goToStart];
        }
    }
    else if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)sixPressed:(id)sender {
    NSLog(@"6 Pressed");
    if([codeEntered count] == 5) {
        NSString *firstChar = [codeEntered objectAtIndex:1];
        NSString *secondChar = [codeEntered objectAtIndex:2];
        NSString *thirdChar = [codeEntered objectAtIndex:3];
        NSString *fourthChar = [codeEntered objectAtIndex:4];
        if([firstChar isEqualToString:@"2"] && [secondChar isEqualToString:@"1"] && [thirdChar isEqualToString:@"0"] && [fourthChar isEqualToString:@"5"]) {
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *start = [mainStoryboard instantiateViewControllerWithIdentifier:@"FinaleVC"];
            [self presentModalViewController:start animated:YES];
        }
        else {
            [self goToStart];
        }
    }
    else if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)sevenPressed:(id)sender {
    NSLog(@"7 Pressed");
    if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)eightPressed:(id)sender {
    NSLog(@"8 Pressed");
    if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)ninePressed:(id)sender {
    NSLog(@"9 Pressed");
    if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}

- (IBAction)zeroPressed:(id)sender {
    NSLog(@"0 Pressed");
    if([codeEntered count] == 3) {
        NSString *firstChar = [codeEntered objectAtIndex:1];
        NSString *secondChar = [codeEntered objectAtIndex:2];
        if([firstChar isEqualToString:@"2"] && [secondChar isEqualToString:@"1"]) {
            [codeEntered addObject:@"0"];
        }
        else {
            [self goToStart];
        }
    }
    else if([codeEntered count] >= 1) {
        [self goToStart];
    }
    else {
        // do nothing, code hasn't started to be entered yet
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
