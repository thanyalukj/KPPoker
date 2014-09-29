//
//  CardViewController.m
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "CardViewController.h"
#import "Card.h"

@interface CardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imageName = [NSString stringWithFormat:@"card_%@", self.card.content];
    self.cardImageView.image = [UIImage imageNamed:imageName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
