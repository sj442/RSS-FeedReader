//
//  DataStore.h
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/24/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

+(DataStore*)sharedDataStore;

@property (strong, nonatomic) NSArray *mainHeadings;
@property (strong, nonatomic) NSArray *mainHeadingsURL;

@property (strong, nonatomic) NSArray *opinionSubheadings;
@property (strong, nonatomic) NSArray *businessSubheadings;
@property (strong, nonatomic) NSArray *newsSubheadings;
@property (strong, nonatomic) NSArray *SnTSubheadings;
@property (strong, nonatomic) NSArray *sportSubheadings;

@property (strong, nonatomic) NSArray *opinionSubheadingsURL;
@property (strong, nonatomic) NSArray *sportSubheadingsURL;
@property (strong, nonatomic) NSArray *businessSubheadingsURL;
@property (strong, nonatomic) NSArray *newsSubheadingsURL;
@property (strong, nonatomic) NSArray *SnTSubheadingsURL;


@end
