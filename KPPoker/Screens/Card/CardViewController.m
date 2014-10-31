//
//  CardViewController.m
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "CardViewController.h"
#import "Card.h"
#import "Configuration.h"
#import "Settings.h"
#import "ScoreInteractor.h"
#import "CurrentStoryInteractor.h"
#import "BaseCurrentStory.h"

@interface CardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@end

@implementation CardViewController {
    ScoreInteractor *_scoreInteractor;
    CurrentStoryInteractor *_currentStoryInteractor;
}

- (void)viewDidLoad {
    [super viewDidLoad];

#ifndef STAND_ALONE
    NSString *_sessionId = [Configuration instance].settings.sessionId;
    if (_sessionId){
        _currentStoryInteractor = [[CurrentStoryInteractor alloc] initWithSessionId:_sessionId];
        _currentStoryInteractor.delegate = self;
        [_currentStoryInteractor start];
    }
#endif
    NSString *imageName = [NSString stringWithFormat:@"card_%@", self.card.content];
    self.cardImageView.image = [UIImage imageNamed:imageName];
}

- (void)setStory:(BaseCurrentStory *)story {
#ifndef STAND_ALONE
    NSString *_userName = [Configuration instance].settings.userName;
    _scoreInteractor = [[ScoreInteractor alloc] initWithStoryId:story.storyId personId:_userName score:self.card.content];
    [_scoreInteractor start];
#endif
}

@end
