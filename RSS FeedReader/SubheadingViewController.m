//
//  SubheadingViewController.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/22/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "SubheadingViewController.h"
#import "secondLevelViewController.h"
#import <RSSParser.h>
#import <RSSItem.h>

@implementation SubheadingViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = self.heading;
    
    self.dictionary = [[NSDictionary alloc]initWithObjects:@[@"http://www.thehindu.com/?service=rss", @"http://www.thehindu.com/news/?service=rss", @"http://www.thehindu.com/opinion/?service=rss", @"http://www.thehindu.com/business/?service=rss", @"http://www.thehindu.com/sport/?service=rss", @"http://www.thehindu.com/sci-tech/?service=rss"] forKeys:@[@"Home", @"News", @"Opinion", @"Business", @"Sport", @"S&T"]];
    
    NSURL *url = [NSURL URLWithString:[self.dictionary objectForKey:self.heading]];
    
    NSLog(@"url %@", url);
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    
    self.feeditemsArray = [[NSMutableArray alloc]init];
    
    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
        
        NSLog(@"got feed items %d", [feedItems count]);
        
        for (int i=0; i<[feedItems count]; i++){
            RSSItem *item = feedItems[i];
            [self.feeditemsArray addObject:item];
            NSLog(@"RSS Item %@", [item description]);
            NSLog(@"RSS Item description %@", item.pubDate);
            
            [self.tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"error %@", error);
    }];
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.feeditemsArray count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = ((RSSItem*)self.feeditemsArray[indexPath.row]).title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    secondLevelViewController *secondlevelVC = [storyboard instantiateViewControllerWithIdentifier:@"secondLevel"];
    
    secondlevelVC.heading = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    [self.navigationController pushViewController:secondlevelVC animated:YES];
    
}

@end
