//
//  TableViewController.m
//  TextViewTable
//
//  Created by Emmanuel Merali on 26/12/2015.
//  Copyright © 2015 rooftoptek.com. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "TextViewTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Insets: %.2f", tableView.contentInset.bottom);
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        case 2: {
            TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
            return cell;
        }
        case 1: {
            TextViewTableViewCell *cell = (TextViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TextViewTableViewCell" forIndexPath:indexPath];
            cell.tableView = tableView;
            return cell;
        }
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"estimatedHeightForRowAtIndexPath:: Insets: %.2f", self.tableView.contentInset.bottom);
    return 80;
}

@end
