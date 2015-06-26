//
//  FISTableViewController.h
//  slapChat
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISDataStore.h"
#import "Recipient.h"
#import "Message.h"


@interface FISTableViewController : UITableViewController


@property (strong, nonatomic) NSArray *managedMessageObjects;
@property (strong, nonatomic) FISDataStore *store;
@property (strong, nonatomic) Recipient *managedRecipient;
@property (strong, nonatomic) NSMutableArray *messagesArray;

@end
