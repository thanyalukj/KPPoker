//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StoriesInteractor : NSObject

- (instancetype)initWithStoryId:(NSString *)storyId score:(NSString *)score;

- (void)start;

@end