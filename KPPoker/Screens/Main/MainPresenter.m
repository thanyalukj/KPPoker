//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "MainPresenter.h"
#import "Deck.h"
#import "Viewing.h"
#import "Configuration.h"

@interface MainPresenter ()
@property (nonatomic) Deck *standardDeck;
@property (nonatomic) Deck *fibonacciDeck;
@property (nonatomic) Deck *tShirtDeck;
@end

@implementation MainPresenter {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createDecks];
    }
    return self;
}

- (void)createDecks {
    self.standardDeck = [[Deck alloc] initWithDeckType:DeckTypeStandard];
    self.fibonacciDeck = [[Deck alloc] initWithDeckType:DeckTypeFibonacci];
    self.tShirtDeck = [[Deck alloc] initWithDeckType:DeckTypeTShirt];
}

- (void)viewDidLoad {
    self.currentDeck = [Configuration instance].selectedDeck;
    if (!self.currentDeck) {
        self.currentDeck = self.standardDeck;
    }
}

- (void)setCurrentDeck:(Deck *)currentDeck {
    _currentDeck = currentDeck;
    [Configuration instance].selectedDeck = currentDeck;
}

- (void)selectDeckType:(NSInteger)deckIndex {
    switch (deckIndex) {
        case DeckTypeStandard:
            self.currentDeck = self.standardDeck;
            break;
        case DeckTypeFibonacci:
            self.currentDeck = self.fibonacciDeck;
            break;
        case DeckTypeTShirt:
            self.currentDeck = self.tShirtDeck;
            break;
        default:
            self.currentDeck = self.standardDeck;
    }
    [self.viewDelegate reloadCard];
}

- (DeckType)currentDeckType {
    return self.currentDeck.deckType;
}

@end