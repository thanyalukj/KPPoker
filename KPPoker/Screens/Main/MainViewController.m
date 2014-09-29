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
#import "CardViewController.h"

@interface MainViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UITabBarDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@end

@implementation MainViewController {
    MainPresenter *_presenter;
    Card *_selectedCard;
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
    [self configureTabBar];
}

- (void)configureTabBar {
    self.tabBar.delegate = self;
    [self.tabBar setSelectedItem:(self.tabBar.items)[(NSUInteger)_presenter.currentDeckType]];
}

- (void)configureCollectionView {
    UINib *cellNib = [UINib nibWithNibName:@"CardCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cardCell"];
    [self.collectionView setScrollEnabled:NO];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self reloadCard];
}

- (void)reloadCard {
    [self updateCollectionViewLayout];
    [self.collectionView reloadData];
}

- (void)updateCollectionViewLayout {
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    collectionViewLayout.itemSize = [self collectionViewItemSize];
    collectionViewLayout.headerReferenceSize = [self collectionViewHeaderSize];
}

- (CGSize)collectionViewItemSize {
    CGSize itemSize = CGSizeMake(70, 90);
    if (_presenter.currentDeckType == DeckTypeTShirt) {
        itemSize = CGSizeMake(70, 90);
    }
    if ([[UIScreen mainScreen] bounds].size.height == 480) {
        if (_presenter.currentDeckType == DeckTypeTShirt) {
            itemSize = CGSizeMake(80, 100);
        } else {
            itemSize = CGSizeMake(60, 80);
        }
    } else if ([[UIScreen mainScreen] bounds].size.height == 568) {
        itemSize = CGSizeMake(70, 90);
    } else if ([[UIScreen mainScreen] bounds].size.height == 667) {
        itemSize = CGSizeMake(90, 110);
    }
    return itemSize;
}

- (CGSize)collectionViewHeaderSize {
    CGFloat headerHeight = 6;
    if (_presenter.currentDeckType == DeckTypeTShirt) {
        headerHeight = 60;
        return CGSizeMake(0, headerHeight);
    }
    if ([[UIScreen mainScreen] bounds].size.height == 480) {
        headerHeight = 10;
    }
    return CGSizeMake(0, headerHeight);
}

#pragma mark - Collection View

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return [self collectionViewItemSize];
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return [self collectionViewHeaderSize];
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_presenter.currentDeck numberOfCards];
}

static NSString *cellIdentifier = @"cardCell";
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *card = [_presenter.currentDeck cardAtIndex:(NSUInteger)indexPath.row];
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setCard:card deckType:_presenter.currentDeckType];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _selectedCard = [_presenter.currentDeck cardAtIndex:(NSUInteger)indexPath.row];
    [self performSegueWithIdentifier:@"viewCard" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewCard"]) {
        CardViewController *cardViewController = segue.destinationViewController;
        cardViewController.card = _selectedCard;
    }
}


#pragma mark - card type
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger selectedIndex = [self.tabBar.items indexOfObject:self.tabBar.selectedItem];
    [_presenter selectDeckType:selectedIndex];
}

@end
