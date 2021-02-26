//
//  SecondDoorVC.m
//  multiscreen
//
//  Created by Matt Bradshaw on 2/23/21.
//

#import "SecondDoorVC.h"

@interface SecondDoorVC ()

@end

@implementation SecondDoorVC

int key = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickedKeyButton:(id)sender {
    key++;
    [_doorButton setTitle:@"Unlocked!" forState:UIControlStateNormal];
}

- (IBAction)clickedDoorButton:(id)sender {
    NSLog(@"%@", _doorButton.currentTitle);

    if(key == 0) {
        // do nothing, door is locked
    }
    else {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *nextStageVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController2"];
        [self presentModalViewController:nextStageVC animated:YES];
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
