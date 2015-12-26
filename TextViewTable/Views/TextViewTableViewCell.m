//
//  TextViewTableViewCell.m
//  TextViewTable
//
//  Created by Emmanuel Merali on 26/12/2015.
//  Copyright © 2015 rooftoptek.com. All rights reserved.
//

#import "TextViewTableViewCell.h"

@interface TextViewTableViewCell (UITextViewDelegate) <UITextViewDelegate>

@end

@interface TextViewTableViewCell (Private)

- (void)updateTextViewHeight:(UITextView *)textView;
- (BOOL)table:(UITableView *)table rectVisible:(CGRect)rect;
- (void)scrollToCursorForTextView:(UITextView*)textView;

@end


@implementation TextViewTableViewCell (UITextViewDelegate)

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self scrollToCursorForTextView:textView];
}

- (void)textViewDidChange:(UITextView *)textView {
    [self.tableView beginUpdates];
    [self updateTextViewHeight:textView];
    [self.tableView endUpdates];
    [self scrollToCursorForTextView:textView];
}

@end

@implementation TextViewTableViewCell (Private)

- (void)updateTextViewHeight:(UITextView *)textView {
    self.heightConstraint.constant = textView.contentSize.height + textView.contentInset.top + textView.contentInset.bottom;
}

- (BOOL)table:(UITableView *)tableView rectVisible:(CGRect)rect {
    CGRect visibleRect;
    visibleRect.origin = tableView.contentOffset;
    visibleRect.origin.y += tableView.contentInset.top;
    visibleRect.size = tableView.bounds.size;
    visibleRect.size.height -= tableView.contentInset.top + tableView.contentInset.bottom;
    
    return CGRectContainsRect(visibleRect, rect);
}

- (void)scrollToCursorForTextView:(UITextView*)textView {
    CGRect cursorRect = [textView caretRectForPosition:textView.selectedTextRange.start];
    cursorRect = [self.tableView convertRect:cursorRect fromView:textView];
    if (![self table:self.tableView rectVisible:cursorRect]) {
        cursorRect.size.height += 8; // To add some space underneath the cursor
        [self.tableView scrollRectToVisible:cursorRect animated:YES];
    }
}

@end

@implementation TextViewTableViewCell

@end
