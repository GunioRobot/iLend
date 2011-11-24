//
//  AddViewController.m
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "iLendAppDelegate.h"

#import "AddViewController.h"
#import "PickerViewController.h"

@implementation AddViewController

@synthesize itemNameTextField, lenderTextField, startDateButton, endDateButton, uiStartDateButton, uiEndDateButton, uiShowPeoplePicker, datePicker, item, imageView;

- (void) save:(id)sender {
    NSLog(@"Save");
    //get the application’s delegate
    iLendAppDelegate* appDelegate = (iLendAppDelegate*)[[UIApplication sharedApplication]
                                                          delegate];
    //get the managedObjectContext
    NSManagedObjectContext* managedObjectContext = appDelegate.managedObjectContext;
    
    Item* newItem;
    if([self item]) {
        newItem = [self item];
    }
    else {
        newItem = (Item*) [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:managedObjectContext];
    }
    
    [newItem setItemName:[itemNameTextField text]];
    [newItem setLender:[lenderTextField text]];
    [newItem setStartDate:[startDateButton date]];
    [newItem setEndDate:[endDateButton date]];
    
    NSError *error = nil;
    [managedObjectContext save:&error];
    if(error) {
        NSLog(@"Error");
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void) hideDatePicker: (id)sender {    
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(save:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    if(lastClickedDateButton == [startDateButton button]) {
        [startDateButton setDate:[datePicker date]];
        if([[datePicker date] compare:[endDateButton date]] == NSOrderedDescending) {
            [endDateButton setDate:[datePicker date]];
        }
    }
    else {
        [endDateButton setDate:[datePicker date]];
        if([[datePicker date] compare:[startDateButton date]] == NSOrderedAscending) {
            [startDateButton setDate:[datePicker date]];
        }
    }
    
    [startDateButton setTitleFromDate:[startDateButton date] forState:UIControlStateNormal];
    [endDateButton setTitleFromDate:[endDateButton date] forState:UIControlStateNormal];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    datePicker.center = CGPointMake(self.view.center.x, self.view.center.y + (self.view.frame.size.height / 2) + (datePicker.frame.size.height / 2));
    
    [UIView commitAnimations];
}
 
- (IBAction) showDatePicker:(id)sender {
    NSLog(@"Show datepicker");
    datePicker.center = CGPointMake(160, self.view.center.y + (self.view.frame.size.height / 2) + (datePicker.frame.size.height / 2));
    
    UIBarButtonItem *pickButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Pick", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(hideDatePicker:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = pickButton;
    
    lastClickedDateButton = sender;
    if(sender == [startDateButton button]) {
        [datePicker setDate:[startDateButton date] animated:YES];
    }
    else {
        [datePicker setDate:[endDateButton date] animated:YES];
    }
    
    
    if(! [datePicker superview]) {
        [[self view] addSubview:datePicker];
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    datePicker.center = CGPointMake(self.view.center.x, self.view.frame.size.height - (datePicker.frame.size.height / 2));
    
    [UIView commitAnimations];
}

# pragma mark - Camera

- (void) showImagePicker {
    NSLog(@"Camera");
    
    //initialize the ImagePicker
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    //set delegate
    imagePicker.delegate = self;
    //check if a camera is available and if it is, set the sourceType correspondingly
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"No Camera Available");
    }
    //show ImagePicker View
    [self presentModalViewController:imagePicker animated: YES];
    [imagePicker release];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *) editingInfo {
    // set the image to the view in order to make it visible
    [imageView setImage:image];
    // hide ImagePickerView
    [self dismissModalViewControllerAnimated:YES];
    
    [imageView setBackgroundColor:[UIColor whiteColor]];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    // get the selected image to store it
    selectedImage = (UIImage *)[info objectForKey: UIImagePickerControllerOriginalImage];
    // set the image to the view in order to make it visible
    [imageView setImage:selectedImage];
    // hide the ImagePickerView
    [self dismissModalViewControllerAnimated:YES];
    
    [imageView setBackgroundColor:[UIColor whiteColor]];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];
}

# pragma mark - Address Book delegates

- (void) showPeoplePicker:(id)sender {
    ABPeoplePickerNavigationController *picker =[[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentModalViewController:picker animated:YES];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [peoplePicker dismissModalViewControllerAnimated:YES];
}

// Called after a person has been selected by the user.
// Return YES if you want the person to be displayed.
// Return NO  to do nothing (the delegate is responsible for dismissing the peoplePicker).
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    NSString* firstName = (NSString *) ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString* lastName = (NSString *) ABRecordCopyValue(person, kABPersonLastNameProperty);
    
    [[self lenderTextField] setText:[NSString stringWithFormat:@"%@ %@", firstName, lastName]];
    
    [firstName release];
    [lastName release];
    
    [peoplePicker dismissModalViewControllerAnimated:YES];
    return NO;
}

// Called after a value has been selected by the user.
// Return YES if you want default action to be performed.
// Return NO to do nothing (the delegate is responsible for dismissing the peoplePicker).
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    [peoplePicker dismissModalViewControllerAnimated:YES];
    return NO;
}

# pragma mark - Gesture Recognizer callbacks

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if([datePicker superview] == [self view]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if(touch.view == imageView) {
        [self showImagePicker];
        
        return NO;
    }
    
    if(touch.view == [startDateButton button] || touch.view == [endDateButton button] || touch.view == datePicker || touch.view == [self uiShowPeoplePicker]) {
        NSLog(@"Should not receive touch");
        return NO;
    }
    
    NSLog(@"Should receive touch: %@", [touch.view description]);
    
    return YES;
}

- (void) hideKeyboard:(id)sender {
    [itemNameTextField resignFirstResponder];
    [lenderTextField resignFirstResponder];
}

#pragma mark - Generated methods

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
    
    UIGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    
    [tapGestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer release];
    
    // Associate buttons with UIDateButton class
    startDateButton = [[UIDateButton alloc] initWithButton:uiStartDateButton];
    endDateButton = [[UIDateButton alloc] initWithButton:uiEndDateButton];
    
    if([self item]) {
        NSLog(@"Item passed");
        
        [itemNameTextField setText:[item itemName]];
        [lenderTextField setText:[item lender]];
        
        [startDateButton setDate:[item startDate]];
        [endDateButton setDate:[item endDate]];
        
        [startDateButton setTitleFromDate:[item startDate] forState:UIControlStateNormal];
        [endDateButton setTitleFromDate:[item endDate] forState:UIControlStateNormal];
    }
    else {
        // Set button dates
        NSDate* date = [NSDate date];
        
        [startDateButton setDate:date];
        [endDateButton setDate:date];
        
        [startDateButton setTitleFromDate:date forState:UIControlStateNormal];
        [endDateButton setTitleFromDate:date forState:UIControlStateNormal];
    }
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
