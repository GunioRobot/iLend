//
//  UIDateButton.m
//  iLend
//
//  Created by Mauricio Hanika on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIDateButton.h"

@implementation UIDateButton

@synthesize date, button;

- (id)initWithButton:(UIButton*)buttonVal {
    if(self = [super init]) {
        button = buttonVal;
    }
    
    return self;
}

- (void)setTitleFromDate:(NSDate *)dateVal forState:(UIControlState)state {
    // Set button dates
    NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:dateVal];
    
    NSInteger year = [dateComponents year];
    NSInteger month = [dateComponents month];
    NSInteger day = [dateComponents day];
    
    [[self button] setTitle:[NSString stringWithFormat:@"%02d.%02d.%4d",day,month,year] forState:state];
    
    [calendar release];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
