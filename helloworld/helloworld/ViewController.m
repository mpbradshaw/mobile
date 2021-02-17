//
//  ViewController.m
//  helloworld
//
//  Created by Matt Bradshaw on 2/15/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickedHWButton:(id)sender {
    if(_myLabel.text.length == 0)
        [_myLabel setText:@"Hello World!"];
    else
        [_myLabel setText:@""];
}

- (IBAction)sliderPosition:(UISlider *)slider {
    self.view.backgroundColor = [UIColor colorWithRed:(0) green:(slider.value) blue:(0) alpha:(1.0)];
}

- (IBAction)clickedCredsButton:(id)sender {
    if(_credsLabel.text.length == 0)
        [_credsLabel setText:@"Created by Matthew Bradshaw"];
    else
        [_credsLabel setText:@""];
}

@end
