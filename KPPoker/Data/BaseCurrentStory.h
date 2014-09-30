//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseCurrentStory : NSObject

@property (nonatomic, assign) NSString *sessionId;
@property (nonatomic, assign) NSString *storyId;

- (instancetype)initWithStoryId:(NSString *)storyId sessionId:(NSString *)sessionId;

@end