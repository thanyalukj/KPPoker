//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@class Card;


@interface CardCell : UICollectionViewCell

@property (nonatomic) Card *card;

- (void)setCard:(Card *)card deckType:(DeckType)deckType;

@end