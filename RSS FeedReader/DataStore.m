//
//  DataStore.m
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/24/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore


+(DataStore*)sharedDataStore{
    static DataStore *sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataStore = [[self alloc] init];
    });
    return sharedDataStore;
}

-(void)mainHeadingsData{
    
    self.opinionSubheadings = @[@"Blogs", @"Columns", @"Editorial"];
    self.businessSubheadings = @[@"Industry", @"Economy", @"Markets"];
    self.newsSubheadings = @[@"International", @"National", @"Cities"];
    self.SnTSubheadings = @[@"Technology", @"Environment", @"Health", @"Science"];
    self.sportSubheadings = @[@"Cricket", @"Football", @"Hockey", @"Tennis", @"Races", @"Other Sports"];
    
    self.mainHeadings = @[@{
                              @"title": @"Home",
                            @"URL": @"http://www.thehindu.com/?service=rss",
                              @"subHeadings":@[]
                            },
                          @{
                              @"title":@"News",
                            @"URL":@"http://www.thehindu.com/news/?service=rss",
                              @"subHeadings":self.newsSubheadings
                              },
                          @{
                              @"title":@"Opinion",
                            @"URL":@"http://www.thehindu.com/opinion/?service=rss",
                              @"subHeadings":self.opinionSubheadings
                              },
                          @{
                              @"title":@"Business",
                            @"URL":@"http://www.thehindu.com/business/?service=rss",
                              @"subHeadings":self.businessSubheadings
                              },
                          @{
                              @"title":@"Sports",
                            @"URL":@"http://www.thehindu.com/sport/?service=rss",
                              @"subHeadings":self.sportSubheadings
                              },
                          @{
                              @"title":@"S&T",
                            @"URL":@"http://www.thehindu.com/sci-tech/?service=rss",
                              @"subHeadings":self.SnTSubheadings
                              }
                          ];
}


@end
