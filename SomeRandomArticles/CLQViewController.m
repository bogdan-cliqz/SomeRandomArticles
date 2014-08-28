//
//  CLQViewController.m
//  SomeRandomArticles
//
//  Created by Bogdan Sulima on 28/08/14.
//  Copyright (c) 2014 Cliqz. All rights reserved.
//

#import "CLQViewController.h"

@interface CLQViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic) NSArray *backgroundImages;
@property NSInteger backgroundImageIndex;

@end


@implementation CLQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backgroundImages = @[
        [UIImage imageNamed:@"bg-1.png"],
        [UIImage imageNamed:@"bg.png"],
        [UIImage imageNamed:@"bg+1.png"]
    ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.backgroundImageIndex = 1;
    [self updateBackgroundImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateBackgroundImage
{
    self.backgroundImageView.image = self.backgroundImages[self.backgroundImageIndex];
}

- (IBAction)articleDetails:(id)sender {
    [self performSegueWithIdentifier:@"ArticleDetails" sender:nil];
}

- (IBAction)handleRightSwipe:(id)sender {
    // PREV article
    if (self.backgroundImageIndex > 0) {
        self.backgroundImageIndex -= 1;
    }
    [self updateBackgroundImage];
}

- (IBAction)handleLeftSwipe:(id)sender {
    // NEXT article
    if (self.backgroundImageIndex < self.backgroundImages.count - 1) {
        self.backgroundImageIndex += 1;
    }
    [self updateBackgroundImage];
}

@end
