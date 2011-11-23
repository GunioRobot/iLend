//
//  UIDateButton.h
//  iLend
//
//  Created by Mauricio Hanika on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDateButton : NSObject {
    NSDate* date;
    UIButton* button;
}

- (id)initWithButton:(UIButton*)button;
- (void)setTitleFromDate:(NSDate *)date forState:(UIControlState)state;

@property(nonatomic, retain) NSDate* date;
@property(nonatomic, retain) UIButton* button;

@end
