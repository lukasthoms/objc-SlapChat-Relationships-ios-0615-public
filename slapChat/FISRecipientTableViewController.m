//
//  FISRecipientTableViewController.m
//  slapChat
//
//  Created by Lukas Thoms on 6/26/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISRecipientTableViewController.h"
#import "Recipient.h"
#import "FISTableViewController.h"
#import "Message.h"

@interface FISRecipientTableViewController ()

@end

@implementation FISRecipientTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.store = [FISDataStore sharedDataStore];
    
    
    Recipient *lukas = [NSEntityDescription insertNewObjectForEntityForName:@"Recipient" inManagedObjectContext:self.store.managedObjectContext];
    
    lukas.name = @"Lukas";
    lukas.email = @"Lukas@stho.ms";
    lukas.phoneNumber = @"309-269-41613";
    lukas.twitterHandle = @"lukasthoms";
    
    Recipient *tyler = [NSEntityDescription insertNewObjectForEntityForName:@"Recipient" inManagedObjectContext:self.store.managedObjectContext];
    
    tyler.name = @"Tyler Fields";
    tyler.email = @"TDfields@gmail.com";
    tyler.phoneNumber = @"4446264345";
    tyler.twitterHandle = @"TD_Fields";
    
    
    Message *messageOne = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.store.managedObjectContext];
    
    messageOne.content = @"Message 1";
    messageOne.createdAt = [NSDate date];
    
    Message *messageTwo = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.store.managedObjectContext];
    messageTwo.content = @"Message 2";
    messageTwo.createdAt = [NSDate date];
    
    Message *messageThree = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.store.managedObjectContext];
    
    messageThree.content = @"Message 3";
    messageThree.createdAt = [NSDate date];
    
    [lukas addMessageObject:messageOne];
    [lukas addMessageObject:messageThree];
    [tyler addMessageObject:messageTwo];
    
    [self.store saveContext];
    

    NSFetchRequest *recipRequest = [[NSFetchRequest alloc] initWithEntityName:@"Recipient"];
    self.managedRecipientObjects = [self.store.managedObjectContext executeFetchRequest:recipRequest error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.managedRecipientObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"receipCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.managedRecipientObjects[indexPath.row] name];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISTableViewController *destination = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    destination.managedRecipient = self.managedRecipientObjects[indexPath.row];
}


@end
