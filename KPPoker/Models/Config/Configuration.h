//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Settings;
@class Deck;


@interface Configuration : NSObject

@property (nonatomic) Settings *settings;
@property (nonatomic) Deck *selectedDeck;

+ (Configuration *)instance;

- (void)saveSettings;
@end