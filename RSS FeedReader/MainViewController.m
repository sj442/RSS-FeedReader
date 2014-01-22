//
//  MainViewController.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/22/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "MainViewController.h"
#import "SubheadingViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *headingsArray;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc]init];
    
    [attributes setObject:[UIFont fontWithName:@"HoeflerText-Black" size:30] forKey:NSFontAttributeName];
    
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    self.headingsArray = @[@"Home", @"News", @"Opinion", @"Business", @"Sport", @"S&T"];
}

-(void)nextButtonTapped:(id)sender{
    
    //SubheadingViewController *subheadingvc = [
    
    
    //[self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>]
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.headingsArray count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
