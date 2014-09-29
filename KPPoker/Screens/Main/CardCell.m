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
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 6;
}

- (void)setCard:(Card *)card {
    _card = card;
    self.backgroundColor = [UIColor colorForContent:_card.content];
    _cardLabel.text = _card.content;
    _cardLabel.textColor = [UIColor colorForContent:_card.content];
}

@end