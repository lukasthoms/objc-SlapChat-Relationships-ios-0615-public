//
//  FISRecipientTableViewController.h
//  slapChat
//
//  Created by Lukas Thoms on 6/26/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISDataStore.h"

@interface FISRecipientTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *managedRecipientObjects;
@property (strong, nonatomic) FISDataStore *store;

@end
