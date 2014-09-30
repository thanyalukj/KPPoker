//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "StoriesInteractor.h"
#import "StoriesTable.h"


@implementation StoriesInteractor {
    NSString *_storyId;
    NSString *_score;
}

- (instancetype)initWithStoryId:(NSString *)storyId score:(NSString *)score {
    if (self = [super init]) {
        _storyId = storyId;
        _score = score;
    }
    return self;
}

- (void)start {
    StoriesTable *storiesTable = [[StoriesTable alloc]init];
    BFTask *insertQuery = [storiesTable insertStoryWithStoryId:_storyId score:_score];
    [[BFTask taskForCompletionOfAllTasks:@[insertQuery]]
            continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
        if (task.error) {
            NSLog(task.error.localizedDescription);
        }
        return nil;
    }];
}

@end