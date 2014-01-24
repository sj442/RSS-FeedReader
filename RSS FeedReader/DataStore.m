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


@end
