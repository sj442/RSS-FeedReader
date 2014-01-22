//
//  SubheadingViewController.h
//  RSS FeedReader
//
//  Created by Sunayna Jain on 1/22/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubheadingViewController : UITableViewController

@property (strong, nonatomic) NSString *heading;

@property (strong, nonatomic) NSDictionary *dictionary;

@property (strong, nonatomic) NSMutableArray *feeditemsArray;

@end
