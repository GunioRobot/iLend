//
//  AddViewController.h
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController {
    UITextField* itemNameTextField;
    UITextField* lenderTextField;
    UIButton* startDateButton;
    UIButton* endDateButton;
    UIDatePicker* datePicker;
}

- (void) save:(id)sender;
- (IBAction) showDatePicker:(id)sender;

@property(nonatomic, retain) IBOutlet UITextField* itemNameTextField;
@property(nonatomic, retain) IBOutlet UITextField* lenderTextField;
@property(nonatomic, retain) IBOutlet UIButton* startDateButton;
@property(nonatomic, retain) IBOutlet UIButton* endDateButton;
@property(nonatomic, retain) IBOutlet UIDatePicker* datePicker;

@end
