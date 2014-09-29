//
//  MainViewController.m
//  KPPoker
//
//  Created by Thanyaluk on 29/09/2014.
//  Copyright (c) 2014 Kotikan. All rights reserved.
//

#import "MainViewController.h"
#import "MainPresenter.h"
#import "Deck.h"
#import "Card.h"
#import "CardCell.h"

@interface MainViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cardTypeSegmentedControl;

@end

@implementation MainViewController {
    MainPresenter *_presenter;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        _presenter = [[MainPresenter alloc] init];
        _presenter.viewDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_presenter viewDidLoad];
    [self configureCollectionView];
    [self configureSegmentedControl];
}

- (void)configureSegmentedControl {
    self.cardTypeSegmentedControl.selectedSegmentIndex = [_presenter currentDeckType];
}

- (void)configureCollectionView {
    UINib *cellNib = [UINib nibWithNibName:@"CardCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cardCell"];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView reloadData];
}

#pragma mark - Collection View

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_presenter.currentDeck numberOfCards];
}

static NSString *cellIdentifier = @"cardCell";
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *card = [_presenter.currentDeck cardAtIndex:(NSUInteger)indexPath.row];
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setCard:card];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *card = [_presenter.currentDeck cardAtIndex:(NSUInteger)indexPath.row];
}

#pragma mark - card type

- (IBAction)cardTypeChanged:(UISegmentedControl *)segmentedControl {
    [_presenter selectDeckType:self.cardTypeSegmentedControl.selectedSegmentIndex];
}

- (void)reloadCard {
    [self.collectionView reloadData];
}

@end
