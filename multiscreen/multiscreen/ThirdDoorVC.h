//
//  ThirdDoorVC.h
//  multiscreen
//
//  Created by Matt Bradshaw on 2/26/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdDoorVC : UIViewController
@property (nonatomic, strong) IBOutlet UISegmentedControl *one;
@property (nonatomic, strong) IBOutlet UISegmentedControl *two;
@property (nonatomic, strong) IBOutlet UISegmentedControl *three;
@property (nonatomic, strong) IBOutlet UISegmentedControl *four;
@property (nonatomic, strong) IBOutlet UISegmentedControl *five;
@property (nonatomic, strong) IBOutlet UISegmentedControl *six;
@property (nonatomic, strong) IBOutlet UISegmentedControl *seven;
@property (nonatomic, strong) IBOutlet UISegmentedControl *eight;
@property (nonatomic, strong) IBOutlet UISegmentedControl *nine;
@property (nonatomic, strong) IBOutlet UISegmentedControl *zero;
@property (nonatomic, strong) IBOutlet UIButton *enter;
@property (nonatomic, strong) IBOutlet UILabel *joke;
@property (nonatomic, strong) IBOutlet UILabel *since;
@property (nonatomic, strong) IBOutlet UILabel *answer;



@end

NS_ASSUME_NONNULL_END
