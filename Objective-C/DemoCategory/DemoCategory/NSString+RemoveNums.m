//
//  NSString+RemoveNums.m
//  DemoCategory
//
//  Created by Linh Nguyen on 6/6/15.
//  Copyright (c) 2015 Linh Nguyen. All rights reserved.
//

#import "NSString+RemoveNums.h"

@implementation NSString (RemoveNums)
-(NSString *)removeNumberFromString:(NSString *)string{
    NSString *trimedString = nil;
    NSCharacterSet *numbersSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    trimedString = [string stringByTrimmingCharactersInSet:numbersSet];
    return trimedString;
}
@end
