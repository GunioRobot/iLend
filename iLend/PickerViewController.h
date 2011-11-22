//
//  PickerViewController.h
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface PickerViewController : UIViewController {
    UILabel* dateLabel;
    UIDatePicker* datePicker;
    UINavigationBar* navigationBar;
}

- (void) save: (id) sender;
- (IBAction) onSelectDate: (id) sender;

@property(nonatomic, retain) IBOutlet UILabel* dateLabel;
@property(nonatomic, retain) IBOutlet UIDatePicker* datePicker;
@property(nonatomic, retain) IBOutlet UINavigationBar* navigationBar;

@end
