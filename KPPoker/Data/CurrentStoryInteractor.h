//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseCurrentStory;

@protocol CurrentStoryInteracting

- (void)setStory:(BaseCurrentStory *)story;

@end

@interface CurrentStoryInteractor : NSObject

@property (nonatomic, weak) id <CurrentStoryInteracting> delegate;

- (instancetype)initWithSessionId:(NSString *)sessionId;

- (void)start;

@end