//
//  CLQArticleViewController.m
//  SomeRandomArticles
//
//  Created by Bogdan Sulima on 28/08/14.
//  Copyright (c) 2014 Cliqz. All rights reserved.
//

#import "CLQArticleViewController.h"

@interface CLQArticleViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIWebView *testkeynote;


@end

@implementation CLQArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_scrollview setScrollEnabled:YES];
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"article"]];


    self.scrollview.contentSize = view.image.size;
    [self.scrollview addSubview:view];
   
    
    [_doneButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backToArticleList:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
