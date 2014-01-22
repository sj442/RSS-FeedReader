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
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.thehindu.com/?service=rss"]];
    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
        
        NSLog(@"got feed items %d", [feedItems count]);
        
        for (int i=0; i<[feedItems count]; i++){
            RSSItem *item = feedItems[i];
            NSLog(@"RSS Item %@", [item description]);
            NSLog(@"RSS Item description %@", item.itemDescription);
        }
        
        
    } failure:^(NSError *error) {
        
        //something went wrong
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
