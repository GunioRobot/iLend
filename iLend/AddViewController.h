//
//  AddViewController.h
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDateButton.h"

@interface AddViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate> {
    UITextField* itemNameTextField;
    UITextField* lenderTextField;
    UIButton* uiStartDateButton;
    UIButton* uiEndDateButton;
    UIDateButton* startDateButton;
    UIDateButton* endDateButton;
    UIButton* lastClickedDateButton;
    UIDatePicker* datePicker;
    
    NSDate* startDate;
    NSDate* endDate;
}

- (void) save:(id)sender;
- (void) hideKeyboard:(id)sender;
//- (void) setButtonTitles;
- (IBAction) showDatePicker:(id)sender;

@property(nonatomic, retain) IBOutlet UITextField* itemNameTextField;
@property(nonatomic, retain) IBOutlet UITextField* lenderTextField;
@property(nonatomic, retain) IBOutlet UIButton* uiStartDateButton;
@property(nonatomic, retain) IBOutlet UIButton* uiEndDateButton;
@property(nonatomic, retain) IBOutlet UIDatePicker* datePicker;
@property(nonatomic, retain) UIDateButton* startDateButton;
@property(nonatomic, retain) UIDateButton* endDateButton;
@property(nonatomic, retain) NSDate* startDate;
@property(nonatomic, retain) NSDate* endDate;

@end
