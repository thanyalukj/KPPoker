//
// Created by Thanyaluk on 29/09/2014.
// Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "Configuration.h"
#import "Settings.h"
#import "Deck.h"


@implementation Configuration

+ (Configuration *)instance {
    static Configuration *_instance = nil;
    static dispatch_once_t token;

    dispatch_once(&token, ^{
        _instance = [[self alloc] init];
    });

    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _settings = [self loadSettings];
        _deck = [self loadDeck];
    }
    return self;
}

- (Settings *)loadSettings {
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedSettings = [currentDefaults objectForKey:@"settings"];
    Settings *settings;
    if (savedSettings != nil) {
        settings = [NSKeyedUnarchiver unarchiveObjectWithData:savedSettings];
    }
    if (!settings) {
        settings = [[Settings alloc] init];
    }
    return settings;
}

- (void)setSettings:(Settings *)settings {
    _settings = settings;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_settings] forKey:@"settings"];
}

- (void)saveSettings {
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_settings] forKey:@"settings"];
}

- (Deck *)loadDeck {
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedDeckData = [currentDefaults objectForKey:@"deck"];
    Deck *deck;
    if (savedDeckData != nil) {
        deck = [NSKeyedUnarchiver unarchiveObjectWithData:savedDeckData];
    }
    return deck;
}

- (void)setDeck:(Deck *)deck {
    _deck = deck;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_deck] forKey:@"deck"];
}

@end