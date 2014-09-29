//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DeckTypeStandard,
    DeckTypeFibonacci,
    DeckTypeTShirt
} DeckType;

@class Card;

@interface Deck : NSObject <NSCoding>

@property (nonatomic, readonly) NSMutableArray *cards;
@property (nonatomic, readonly) DeckType deckType;

- (instancetype)initWithDeckType:(DeckType)deckType;
- (instancetype)initWithContents:(NSArray *)contents;
- (Card *)cardAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfCards;
@end