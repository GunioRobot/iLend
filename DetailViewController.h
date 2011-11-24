//
//  DetailViewController.h
//  iLend
//
//  Created by praktikum on 21.11.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController

- (void) pushEditViewController: (id)sender;

@property(nonatomic, retain) Item* item;

@property(nonatomic, retain) IBOutlet UILabel* itemNameLabel;
@property(nonatomic, retain) IBOutlet UILabel* lenderLabel;
@property(nonatomic, retain) IBOutlet UILabel* lendPeriodLabel;

@end
