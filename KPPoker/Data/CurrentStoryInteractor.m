//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Bolts/BFExecutor.h>
#import "CurrentStoryInteractor.h"
#import "BFTask.h"
#import "CurrentStoryTable.h"
#import "StoriesTable.h"


@implementation CurrentStoryInteractor {
    NSString *_sessionId;
}

- (instancetype)initWithSessionId:(NSString *)sessionId {
    if (self = [super init]){
        _sessionId = sessionId;
    }
    return self;
}

- (void)start {
    CurrentStoryTable *currentStoryTable = [[CurrentStoryTable alloc]init];
    BFTask *currentStoryQuery = [currentStoryTable fetchCurrentStoryWithSessionId:_sessionId];
    [currentStoryQuery
            continueWithExecutor:[BFExecutor mainThreadExecutor] withSuccessBlock:^id(BFTask *task) {
        if (task.error) {
            NSLog(task.error.localizedDescription);
        } else {
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
            if (paginatedOutput.items){
                CurrentStory *currentStory = paginatedOutput.items.firstObject;
                [_delegate setStory:currentStory];
            }
        }
        return nil;
    }];
}

@end