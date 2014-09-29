//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@class Deck;
@protocol Viewing;


@interface MainPresenter : NSObject

@property (nonatomic) Deck *currentDeck;
@property (nonatomic, weak) id<Viewing> viewDelegate;
- (void)viewDidLoad;

- (void)selectDeckType:(NSInteger)deckIndex;

- (DeckType)currentDeckType;
@end