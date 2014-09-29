//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "UIColor+helper.h"


@implementation UIColor (helper)

+ (UIColor *)colorForContent:(NSString *)content {
    if ([@[@"0", @"13", @"shirt_s"] containsObject:content]) {
        return [self KKPurple];
    }
    if ([@[@"1", @"12", @"shirt_m"] containsObject:content]) {
        return [self KKBlue];
    }
    if ([@[@"2", @"40", @"shirt_l"] containsObject:content]) {
        return [self KKGreen];
    }
    if ([@[@"3", @"100", @"shirt_xl"] containsObject:content]) {
        return [self KKOrange];
    }
    if ([@[@"3", @"100", @"shirt_xl"] containsObject:content]) {
        return [self KKYellow];
    }
    if ([@[@"5", @"coffee", @"shirt_xxl"] containsObject:content]) {
        return [self KKOrange];
    }
    if ([@[@"8", @"?", @"shirt_xs"] containsObject:content]) {
        return [self KKPink];
    }
    return [self KKPurple];
}

+ (UIColor *)KKPink {
    return [self colorWith8BitRed:216 green:31 blue:84 alpha:1];
}

+ (UIColor *)KKPurple {
    return [self colorWith8BitRed:127 green:63 blue:145 alpha:1];
}

+ (UIColor *)KKBlue {
    return [self colorWith8BitRed:18 green:166 blue:224 alpha:1];
}

+ (UIColor *)KKGreen {
    return [self colorWith8BitRed:113 green:183 blue:71 alpha:1];
}

+ (UIColor *)KKYellow {
    return [self colorWith8BitRed:233 green:171 blue:34 alpha:1];
}

+ (UIColor *)KKOrange {
    return [self colorWith8BitRed:221 green:87 blue:38 alpha:1];
}

+ (UIColor *)colorWith8BitRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end