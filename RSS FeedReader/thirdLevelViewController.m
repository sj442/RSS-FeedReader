//
//  thirdLevelViewController.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/24/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "thirdLevelViewController.h"
#import <RSSItem.h>
#import <RSSParser.h>

@interface thirdLevelViewController ()

@property (strong, nonatomic) NSArray *opinionArray;

@property (strong, nonatomic) NSArray *sportsArray;

@property (strong, nonatomic) NSArray *businessArray;

@property (strong, nonatomic) NSArray *newsArray;

@property (strong, nonatomic) NSArray *SnTArray;

@property (strong, nonatomic) NSArray *objectsArray;

@property (strong, nonatomic) NSArray *keysArray;

@property (strong, nonatomic) NSArray *opinionSubheadings;
@property (strong, nonatomic) NSArray *businessSubheadings;
@property (strong, nonatomic) NSArray *newsSubheadings;
@property (strong, nonatomic) NSArray *SnTSubheadings;
@property (strong, nonatomic) NSArray *sportSubheadings;

@property (strong, nonatomic) NSDictionary *dictionary;

@property (strong, nonatomic) NSMutableArray *feeditemsArray;

@property (strong, nonatomic) NSDictionary *opinion;
@property (strong, nonatomic) NSDictionary *news;
@property (strong, nonatomic) NSDictionary *business;
@property (strong, nonatomic) NSDictionary *sport;
@property (strong, nonatomic) NSDictionary *SnT;


@end

@implementation thirdLevelViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = self.heading;
    
    self.opinionArray = @[@"http://www.thehindu.com/opinion/blogs/?service=rss", @"http://www.thehindu.com/opinion/columns/?service=rss", @"http://www.thehindu.com/opinion/editorial/?service=rss"];
    
    self.sportsArray = @[@"http://www.thehindu.com/sport/cricket/?service=rss", @"http://www.thehindu.com/sport/football/?service=rss", @"http://www.thehindu.com/sport/hockey/?service=rss", @"http://www.thehindu.com/sport/tennis/?service=rss", @"http://www.thehindu.com/sport/races/?service=rss", @"http://www.thehindu.com/sport/other-sports/?service=rss"];
    
    self.businessArray = @[@"http://www.thehindu.com/business/Industry/?service=rss", @"http://www.thehindu.com/business/Economy/?service=rss", @"http://www.thehindu.com/business/markets/?service=rss"];
    
    self.newsArray = @[@"http://www.thehindu.com/news/international/?service=rss", @"http://www.thehindu.com/news/national/?service=rss", @"http://www.thehindu.com/news/cities/?service=rss"];
    
    self.SnTArray = @[@"http://www.thehindu.com/sci-tech/technology/?service=rss", @"http://www.thehindu.com/sci-tech/energy-and-environment/?service=rss", @"http://www.thehindu.com/sci-tech/health/?service=rss", @"http://www.thehindu.com/sci-tech/science/?service=rss"];
    
    self.objectsArray = @[self.newsArray, self.opinionArray, self.businessArray, self.sportsArray, self.SnTArray];
    
    self.news = [[NSDictionary alloc]initWithObjects:self.newsArray forKeys:self.newsSubheadings];
    self.opinion= [[NSDictionary alloc]initWithObjects:self.opinionArray forKeys:self.opinionSubheadings];
    self.business = [[NSDictionary alloc]initWithObjects:self.businessArray forKeys:self.businessSubheadings];
    self.sport = [[NSDictionary alloc]initWithObjects:self.sportsArray forKeys:self.sportSubheadings];
    self.SnT = [[NSDictionary alloc]initWithObjects:self.SnTArray forKeys:self.SnTSubheadings];
    
    self.opinionSubheadings = @[@"Blogs", @"Columns", @"Editorial"];
    self.businessSubheadings = @[@"Industry", @"Economy", @"Markets"];
    self.newsSubheadings = @[@"International", @"National", @"Cities"];
    self.SnTSubheadings = @[@"Technology", @"Environment", @"Health", @"Science"];
    self.sportSubheadings = @[@"Cricket", @"Football", @"Hockey", @"Tennis", @"Races", @"Other Sports"];
    
    self.keysArray = @[self.newsSubheadings, self.opinionSubheadings, self.businessSubheadings, self.sportSubheadings, self.SnTSubheadings];

    self.dictionary = [[NSDictionary alloc]initWithObjects:self.objectsArray forKeys:self.keysArray];
    
    
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
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"thirdLevel"];
    
    cell.textLabel.text = self.feeditemsArray[indexPath.row];
    
    return cell;
    
}



@end
