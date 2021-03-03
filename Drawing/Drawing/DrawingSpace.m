//
//  DrawingSpace.m
//  Drawing
//
//  Created by Matt Bradshaw on 3/2/21.
//

#import "DrawingSpace.h"

@implementation DrawingSpace
@synthesize touch_x, touch_y;       // allows set or get the touches

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"Redrew");
    CGRect bounds = [self bounds];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor blueColor] setFill];
    CGContextFillRect(context, bounds);
    
    [[UIColor whiteColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(touch_x, touch_y, 50, 50));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        CGPoint p = [t locationInView:self];
        NSLog(@"Touch at %f, %f", p.x, p.y);
        touch_x = p.x;
        touch_y = p.y;
        [self setNeedsDisplay]; // lets the program know it needs to redraw the screen on press
    }
}

@end
