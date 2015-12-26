//
//  TextViewTableViewCell.h
//  TextViewTable
//
//  Created by Emmanuel Merali on 26/12/2015.
//  Copyright © 2015 rooftoptek.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTableViewCell : UITableViewCell

@property (nonatomic, weak) UITableView                     *tableView;
@property (weak, nonatomic) IBOutlet UITextView             *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint     *heightConstraint;

@end
