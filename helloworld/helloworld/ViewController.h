//
//  ViewController.h
//  helloworld
//
//  Created by Matt Bradshaw on 2/15/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *myLabel;
@property (nonatomic, strong) IBOutlet UIButton *myButton;
@property (nonatomic, weak) IBOutlet UISlider *mySlider;
@property (nonatomic, strong) IBOutlet UILabel *credsLabel;
@property (nonatomic, strong) IBOutlet UIButton *creditsButton;

@end

