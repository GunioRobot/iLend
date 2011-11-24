//
//  DetailViewController.m
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "AddViewController.h"

@implementation DetailViewController

@synthesize item, itemNameLabel, lenderLabel, lendPeriodLabel, imageView;

- (void) pushEditViewController: (id)sender {
    AddViewController* addViewController = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    

    [addViewController setItem:[self item]];
    
    [self.navigationController pushViewController:addViewController animated:YES];
    [addViewController release];
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
    UIBarButtonItem *editButton = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Edit", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(pushEditViewController:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = editButton;
    self.navigationItem.title = @"Details";
    
    [itemNameLabel setText:[item itemName]];
    [lenderLabel setText:[item lender]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if([self item]) {
        NSLog(@"View did appear");
        [itemNameLabel setText:[item itemName]];
        [lenderLabel setText:[item lender]];
        [imageView setImage:[item image]];
        NSLog(@"Image: %@", [[item image] description]);

    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
