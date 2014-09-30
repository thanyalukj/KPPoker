//
// Created by David Cumming on 30/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "SessionsInteractor.h"
#import "AWSDynamoDBObjectMapper.h"
#import "SessionsTable.h"


@implementation SessionsInteractor {
    NSString *_sessionId;
    NSString *_personId;
}

- (instancetype)initWithSessionId:(NSString *)sessionId personId:(NSString *)personId {
    if (self = [super init]){
        _sessionId = sessionId;
        _personId = personId;
    }
    return self;
}


- (void)start {
    SessionsTable *sessionsTable = [[SessionsTable alloc]init];
    BFTask *insertQuery = [sessionsTable insertSessionWithSessionId:_sessionId personId:_personId];

    [[BFTask taskForCompletionOfAllTasks:@[insertQuery]]
            continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
        if (task.error) {
            NSLog(task.error.localizedDescription);
        }
        return nil;
    }];

}

@end