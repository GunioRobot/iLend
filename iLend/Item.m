//
//  Item.m
//  iLend
//
//  Created by Mauricio Hanika on 24.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@interface ImageToDataTransformer : NSValueTransformer {
}
@end

@implementation Item

@dynamic itemName;
@dynamic lender;
@dynamic startDate;
@dynamic endDate;
@dynamic image;

@end

@implementation ImageToDataTransformer
+ (BOOL)allowsReverseTransformation {
    return YES;
}
+ (Class)transformedValueClass {
    return [NSData class];
}
- (id)transformedValue:(id)value {
    NSData *data = UIImagePNGRepresentation(value);
    return data;
}
- (id)reverseTransformedValue:(id)value {
    UIImage *uiImage = [[UIImage alloc] initWithData:value];
    return [uiImage autorelease];
}
@end