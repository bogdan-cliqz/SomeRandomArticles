//
//  CLQViewController.m
//  SomeRandomArticles
//
//  Created by Bogdan Sulima on 28/08/14.
//  Copyright (c) 2014 Cliqz. All rights reserved.
//

#import "CLQViewController.h"

@interface CLQViewController ()
@property (weak, nonatomic) IBOutlet UIView *fibonacciContainer;
@end


@implementation CLQViewController

{
    CGRect frames[8];
    int colorIndex;
    NSArray *colors;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    frames[0] = CGRectMake(-520, 0, 520, 520);
    frames[1] = CGRectMake(0, 0, 320, 320);
    frames[2] = CGRectMake(120, 320, 200, 200);
    frames[3] = CGRectMake(0, 400, 120, 120);
    frames[4] = CGRectMake(0, 320, 80, 80);
    frames[5] = CGRectMake(80, 320, 40, 40);
    frames[6] = CGRectMake(80, 360, 40, 40);
    frames[7] = CGRectMake(120,400, 0, 0);
    
    colors = @[
        [UIColor redColor],
        [UIColor purpleColor],
        [UIColor greenColor],
        [UIColor grayColor],
        [UIColor yellowColor],
        [UIColor blueColor],
        [UIColor orangeColor],
        [UIColor cyanColor],
        [UIColor brownColor],
        [UIColor blackColor]
    ];
    
    for (colorIndex = 0; colorIndex < 6; colorIndex++) {
        UIView *v=[[UIView alloc]initWithFrame:frames[colorIndex + 1]];
        v.backgroundColor = [colors objectAtIndex:colorIndex];
        [_fibonacciContainer addSubview:v];
    }
    colorIndex--;
}

- (IBAction)articleDetails:(id)sender {
    [self performSegueWithIdentifier:@"ArticleDetails" sender:nil];
}

- (IBAction)leftSwipe:(id)sender {
    [self rotate:-1];
}

- (IBAction)rightSwipe:(id)sender {
    [self rotate:1];
}

- (void)rotate:(NSInteger)index
{

    
    UIView *view = [[UIView alloc] init];
    colorIndex -= index;
    if (colorIndex > ((int)colors.count) - 1)
        colorIndex = 0;
    
    if (colorIndex < 0)
        colorIndex = ((int)colors.count) - 1;

    int newColor = colorIndex;
    if (index > 0) {
        newColor -= 5;
        if (newColor < 0)
            newColor += colors.count;
        NSLog(@"Color index: %d color: %d", colorIndex, newColor);
    }
    view.backgroundColor = [colors objectAtIndex:newColor];
    if (index == 1) {
        view.frame = frames[0];
        [self.fibonacciContainer insertSubview:view atIndex:0];
        [self.fibonacciContainer sendSubviewToBack:view];
    } else {
        view.frame = frames[7];
        [self.fibonacciContainer addSubview:view];
        [self.fibonacciContainer bringSubviewToFront:view];
    }
    
    NSArray *views = self.fibonacciContainer.subviews;
    
    NSAssert(7 == views.count, @"7 Views expected");
    int delta = (index > 0) ? 0 : 1;
    [UIView animateWithDuration:1 animations:^{
        for (int i = 0; i < views.count; i++) {
            UIView *srcView = [views objectAtIndex:i];
            srcView.frame = frames[delta+i+index];
            
            //view.frame = frames[1i + index];
            //view.backgroundColor = colors[colorIndex + index];
        }
    } completion:^(BOOL finished) {
        if (index > 0) {
            [[views lastObject] removeFromSuperview];
        } else {
            [[views firstObject] removeFromSuperview];
        }
    }];
    
}

@end
