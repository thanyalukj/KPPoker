//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "BaseCurrentStory.h"


@implementation BaseCurrentStory

- (instancetype)initWithStoryId:(NSString *)storyId sessionId:(NSString *)sessionId {
    if (self = [super init]) {
        _sessionId = sessionId;
        _storyId = storyId;
    }
    return self;
}

@end