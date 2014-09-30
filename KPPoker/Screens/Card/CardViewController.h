//
//  CardViewController.h
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentStoryInteractor.h"

@class Card;

@interface CardViewController : UIViewController <CurrentStoryInteracting>
@property (nonatomic) Card *card;
@end
