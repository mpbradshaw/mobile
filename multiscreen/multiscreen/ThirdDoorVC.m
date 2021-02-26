//
//  ThirdDoorVC.m
//  multiscreen
//
//  Created by Matt Bradshaw on 2/26/21.
//

#import "ThirdDoorVC.h"

@interface ThirdDoorVC ()

@end

@implementation ThirdDoorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickedEnter:(id)sender {
    if([_seven selectedSegmentIndex] == 1 && [_eight selectedSegmentIndex] == 1 && [_nine selectedSegmentIndex] == 1 && [_one selectedSegmentIndex] == 0 && [_two selectedSegmentIndex] == 0 && [_three selectedSegmentIndex] == 0 && [_four selectedSegmentIndex] == 0 && [_five selectedSegmentIndex] == 0 && [_six selectedSegmentIndex] == 0 && [_zero selectedSegmentIndex] == 0) {
        [_joke setText:@"Ha. Get it?"];
        [_since setText:@"Well, since ya have a nice sense of humor to ya:"];
        [_answer setText:@"Click the top right of door 2's cave to unlock the door"];
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
