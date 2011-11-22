//
//  AddViewController.m
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"
#import "PickerViewController.h"

@implementation AddViewController

@synthesize itemNameTextField, lenderTextField, startDateButton, endDateButton, datePicker;

- (void) save:(id)sender {

}

- (void) hideDatePicker: (id)sender {    
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(save:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    datePicker.center = CGPointMake(self.view.center.x, self.view.center.y + (self.view.frame.size.height / 2) + (datePicker.frame.size.height / 2));
    
    [UIView commitAnimations];
}

- (IBAction) showDatePicker:(id)sender {
    datePicker.center = CGPointMake(160, self.view.center.y + (self.view.frame.size.height / 2) + (datePicker.frame.size.height / 2));
    
    UIBarButtonItem *pickButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Pick", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(hideDatePicker:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = pickButton;
    
    if(! [datePicker superview]) {
        [[self view] addSubview:datePicker];
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    datePicker.center = CGPointMake(self.view.center.x, self.view.frame.size.height - (datePicker.frame.size.height / 2));
    
    [UIView commitAnimations];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(save:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    self.navigationItem.title = @"Add";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
