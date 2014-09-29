//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"
#import "UIColor+helper.h"


@implementation CardCell {
    __weak IBOutlet UILabel *_cardLabel;
    __weak IBOutlet UIImageView *_cardImageView;
    DeckType _deckType;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 6;
}

- (void)setCard:(Card *)card deckType:(DeckType)deckType {
    _deckType = deckType;
    [self setCard:card];
}

- (void)setCard:(Card *)card {
    _card = card;

    NSString *imageName = [NSString stringWithFormat:@"card_small_%@", _card.content];
    UIImage *cardImage = [UIImage imageNamed:imageName];
    if (cardImage) {
        _cardImageView.image = cardImage;
        _cardLabel.text = nil;
    } else {
        _cardImageView.image = [UIImage imageNamed:@"card_small"];
        _cardLabel.text = [[_card.content stringByReplacingOccurrencesOfString:@"shirt_" withString:@""] uppercaseString];
    }
    self.backgroundColor = [UIColor colorForContent:_card.content];
    _cardLabel.textColor = [UIColor colorForContent:_card.content];
}

@end