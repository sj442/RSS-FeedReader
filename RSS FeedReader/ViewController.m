//
//  ViewController.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/22/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "ViewController.h"
#import <RSSParser.h>
#import <RSSItem.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.thehindu.com/news/international/world/?service=rss"]];
    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
        
        NSLog(@"got feed items %d", [feedItems count]);
        
        for (int i=0; i<[feedItems count]; i++){
            RSSItem *item = feedItems[i];
            NSLog(@"RSS Item %@", [item description]);
            NSLog(@"RSS Item description %@", item.pubDate);
        }
        [self addScrollViewForFeeditemsCount:[feedItems count] andFeedItems:feedItems];
        
    } failure:^(NSError *error) {
        NSLog(@"error %@", error);
    }];
}

-(void)addScrollViewForFeeditemsCount:(NSInteger)count andFeedItems:(NSArray*)feedItems{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 100*count);
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    NSInteger Ycoordinate = 30;
    
    for (int i=0; i<count; i++){
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, Ycoordinate, self.view.frame.size.width-40, ((RSSItem*)feedItems[i]).title.length*1.5)];
        view.layer.borderWidth = 2.0f;
        view.layer.borderColor = [UIColor blueColor].CGColor;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, view.frame.size.width-20, view.frame.size.height)];
        label.text = ((RSSItem*)feedItems[i]).title;
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.numberOfLines  =0;
        label.textAlignment = NSTextAlignmentJustified;
        [view addSubview:label];
        [scrollView addSubview:view];
        Ycoordinate = Ycoordinate + view.frame.size.height+15;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
