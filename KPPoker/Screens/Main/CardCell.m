//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"


@implementation CardCell {
    __weak IBOutlet UILabel *_cardLabel;
}

- (void)setCard:(Card *)card {
    _card = card;
    _cardLabel.text = _card.content;
}

@end