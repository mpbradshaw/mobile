//
//  FirstDoorViewController.m
//  multiscreen
//
//  Created by Matt Bradshaw on 2/22/21.
//

#import "FirstDoorViewController.h"

@interface FirstDoorViewController ()

@end

@implementation FirstDoorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sliderPosition:(UISlider *)slider {
    self.view.backgroundColor = [UIColor colorWithRed:(slider.value) green:(slider.value) blue:(slider.value) alpha:(1.0)];
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
