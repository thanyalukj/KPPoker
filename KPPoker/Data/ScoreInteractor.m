//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "ScoreInteractor.h"
#import "AWSDynamoDBObjectMapper.h"
#import "ScoreTable.h"


@implementation ScoreInteractor {
    NSString *_storyId;
    NSString *_personId;
    NSString *_score;
}

- (instancetype)initWithStoryId:(NSString *)storyId personId:(NSString *)personId score:(NSString *)score {
    if (self = [super init]){
        _storyId = storyId;
        _personId = personId;
        _score = score;
    }
    return self;
}

- (void)start {
    ScoreTable *scoreTable = [[ScoreTable alloc]init];
    BFTask *insertQuery = [scoreTable insertScoreWithStoryId:_storyId personId:_personId scoreValue:_score];
    [[BFTask taskForCompletionOfAllTasks:@[insertQuery]]
            continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
        if (task.error) {
            NSLog(task.error.localizedDescription);
        }
        return nil;
    }];
}

@end