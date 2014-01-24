//
//  secondLevelViewController.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/24/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "secondLevelViewController.h"
#import "thirdLevelViewController.h"

@interface secondLevelViewController ()

@property (strong, nonatomic) NSArray *opinionSubheadings;
@property (strong, nonatomic) NSArray *businessSubheadings;
@property (strong, nonatomic) NSArray *newsSubheadings;
@property (strong, nonatomic) NSArray *SnTSubheadings;
@property (strong, nonatomic) NSArray *sportSubheadings;

@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSArray *subheadingsArray;

@end

@implementation secondLevelViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.title = self.heading;
    
    self.opinionSubheadings = @[@"Blogs", @"Columns", @"Editorial"];
    self.businessSubheadings = @[@"Industry", @"Economy", @"Markets"];
    self.newsSubheadings = @[@"International", @"National", @"Cities"];
    self.SnTSubheadings = @[@"Technology", @"Environment", @"Health", @"Science"];
    self.sportSubheadings = @[@"Cricket", @"Football", @"Hockey", @"Tennis", @"Races", @"Other Sports"];
    
    self.array = [[NSArray alloc]initWithObjects:self.newsSubheadings, self.opinionSubheadings, self.businessSubheadings, self.sportSubheadings, self.SnTSubheadings, nil];
    
    self.dictionary = [[NSDictionary alloc]initWithObjects:self.array forKeys:@[@"News", @"Opinion", @"Business", @"Sport", @"S&T"]];
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    self.subheadingsArray = [self.dictionary objectForKey:self.heading];
    
    [self drawRectInTableView];
    
    return  [self.subheadingsArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"secondLevel"];
    
    cell.textLabel.text = self.subheadingsArray[indexPath.row];
    
    return cell;
}

-(void)drawRectInTableView{
    
    CGFloat occupiedLength = self.navigationController.navigationBar.frame.size.height + self.tableView.rowHeight*([self.subheadingsArray count]-1);
    
    CGFloat rectHeight = self.view.frame.size.height - occupiedLength;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, occupiedLength, self.view.frame.size.width, rectHeight)];
    
    view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    thirdLevelViewController *thirdlevelVC = [storyboard instantiateViewControllerWithIdentifier:@"thirdLevel"];
    
    thirdlevelVC.heading = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    thirdlevelVC.parentHeading = self.heading;
    
    [self.navigationController pushViewController:thirdlevelVC animated:YES];
    
}





@end
