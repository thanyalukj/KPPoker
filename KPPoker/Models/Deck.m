//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck ()
@property (nonatomic, readwrite) NSMutableArray *cards;
@property (nonatomic, readwrite) DeckType deckType;
@end

@implementation Deck

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.cards = [coder decodeObjectForKey:@"cards"];
    self.deckType = (DeckType)[coder decodeIntegerForKey:@"deckType"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.cards forKey:@"cards"];
    [coder encodeInteger:self.deckType forKey:@"deckType"];
}

- (instancetype)initWithDeckType:(DeckType)deckType {
    self = [super init];
    if (self) {
        _deckType = deckType;
        NSArray *contents = [self contentsForDeckType:deckType];
        [self addContents:contents];
    }
    return self;
}

- (NSArray *)contentsForDeckType:(DeckType)type {
    switch (type) {
        case DeckTypeStandard:
            return @[@"0", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"90", @"100", @"?", @"coffee"];
        case DeckTypeFibonacci:
            return @[@"0", @"1", @"2", @"3", @"5", @"8", @"13", @"21", @"34", @"55", @"89", @"144", @"?", @"coffee"];
        case DeckTypeTShirt:
            return @[@"XS", @"S", @"M", @"L", @"XL", @"XXL", @"?", @"coffee"];
        default:
            return @[@"0", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"90", @"100", @"?", @"coffee"];
    }
}

- (instancetype)initWithContents:(NSArray *)contents {
    self = [super init];
    if (self) {
        [self addContents:contents];
    }
    return self;
}

- (void)addContents:(NSArray *)contents {
    self.cards = [NSMutableArray new];
    for (NSUInteger i =0; i < [contents count]; i++) {
        Card *card = [[Card alloc] initWithContent:contents[i]];
        [self.cards addObject:card];
    }
}

- (NSUInteger)numberOfCards {
    return [self.cards count];
}

- (Card *)cardAtIndex:(NSUInteger)index {
    if (index >= [self.cards count]) {
        return nil;
    }
    return (Card *)self.cards[index];
}

@end