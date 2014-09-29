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
    self.selectedDeck = [Configuration instance].deck;
    if (!self.selectedDeck) {
        self.selectedDeck = self.standardDeck;
    }
}

- (void)setSelectedDeck:(Deck *)selectedDeck {
    _selectedDeck = selectedDeck;
    [Configuration instance].deck = selectedDeck;
}

- (void)selectDeckType:(DeckType)deckType {
    switch (deckType) {
        case DeckTypeStandard:
            self.selectedDeck = self.standardDeck;
            break;
        case DeckTypeFibonacci:
            self.selectedDeck = self.fibonacciDeck;
            break;
        case DeckTypeTShirt:
            self.selectedDeck = self.tShirtDeck;
            break;
        default:
            self.selectedDeck = self.standardDeck;
    }
    [self.viewDelegate reloadCard];
}

- (DeckType)selectedDeckType {
    return self.selectedDeck.deckType;
}

@end