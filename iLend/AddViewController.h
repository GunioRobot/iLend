//
//  AddViewController.h
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "UIDateButton.h"
#import "Item.h"

@interface AddViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate, ABPeoplePickerNavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UITextField* itemNameTextField;
    UITextField* lenderTextField;
    UIButton* uiStartDateButton;
    UIButton* uiEndDateButton;
    UIDateButton* startDateButton;
    UIDateButton* endDateButton;
    UIButton* lastClickedDateButton;
    UIDatePicker* datePicker;
    UIImage* selectedImage;
}

- (void) save:(id)sender;
- (void) hideKeyboard:(id)sender;
//- (void) setButtonTitles;
- (IBAction) showDatePicker:(id)sender;
- (IBAction) showPeoplePicker:(id)sender;
- (void) showImagePicker;

@property(nonatomic, retain) IBOutlet UITextField* itemNameTextField;
@property(nonatomic, retain) IBOutlet UITextField* lenderTextField;
@property(nonatomic, retain) IBOutlet UIButton* uiStartDateButton;
@property(nonatomic, retain) IBOutlet UIButton* uiEndDateButton;
@property(nonatomic, retain) IBOutlet UIButton* uiShowPeoplePicker;
@property(nonatomic, retain) IBOutlet UIDatePicker* datePicker;
@property(nonatomic, retain) IBOutlet UIImageView* imageView;
@property(nonatomic, retain) UIDateButton* startDateButton;
@property(nonatomic, retain) UIDateButton* endDateButton;

@property(nonatomic, retain) Item* item;

@end
