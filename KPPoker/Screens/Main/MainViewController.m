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
    [self reloadCard];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadTabBar];
}

- (void)configureCollectionView {
    UINib *cellNib = [UINib nibWithNibName:@"CardCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cardCell"];
    [self.collectionView setScrollEnabled:NO];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)configureTabBar {
    self.tabBar.delegate = self;
}

- (void)reloadCard {
    [self updateCollectionViewLayout];
    [self.collectionView reloadData];
}

- (void)reloadTabBar {
    [self.tabBar setSelectedItem:(self.tabBar.items)[(NSUInteger)_presenter.selectedDeckType]];
}

- (void)updateCollectionViewLayout {
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    collectionViewLayout.itemSize = [self collectionViewItemSize];
    collectionViewLayout.headerReferenceSize = [self collectionViewHeaderSize];
}

- (CGSize)collectionViewItemSize {
    CGSize itemSize = CGSizeMake(70, 90);
    if ([[UIScreen mainScreen] bounds].size.height == 480) {
        if (_presenter.selectedDeckType == DeckTypeTShirt) {
            itemSize = CGSizeMake(80, 100);
        } else {
            itemSize = CGSizeMake(60, 80);
        }
    }
    if (_presenter.selectedDeckType == DeckTypeTShirt) {
        itemSize = CGSizeMake(70, 90);
    } else if ([[UIScreen mainScreen] bounds].size.height == 568) {
        itemSize = CGSizeMake(70, 90);
    } else if ([[UIScreen mainScreen] bounds].size.height == 667) {
        itemSize = CGSizeMake(90, 110);
    } else if ([[UIScreen mainScreen] bounds].size.height == 736) {
        itemSize = CGSizeMake(100, 120);
    }
    return itemSize;
}

- (CGSize)collectionViewHeaderSize {
    CGSize itemSize = [self collectionViewItemSize];
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    CGFloat spacing = collectionViewLayout.minimumLineSpacing;
    NSLog(@"%f", [self collectionViewNumberOfRows]);
    CGFloat collectionViewHeight = 2*spacing + (itemSize.height+spacing) * [self collectionViewNumberOfRows];
    CGFloat viewHeight = self.view.bounds.size.height - self.tabBar.bounds.size.height;
    return CGSizeMake(0, ((viewHeight - collectionViewHeight)/2));
}

- (CGFloat)collectionViewNumberOfRows {
    CGSize itemSize = [self collectionViewItemSize];
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    CGFloat spacing = collectionViewLayout.minimumInteritemSpacing;
    CGFloat numberOfCellsPerRow = (NSUInteger) (self.view.bounds.size.width - 2*spacing)/ (NSUInteger) (itemSize.width + spacing);
    return ceilf([_presenter.selectedDeck numberOfCards] / numberOfCellsPerRow);
}

#pragma mark - Collection View

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_presenter.selectedDeck numberOfCards];
}

static NSString *cellIdentifier = @"cardCell";
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *card = [_presenter.selectedDeck cardAtIndex:(NSUInteger) indexPath.row];
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setCard:card deckType:_presenter.selectedDeckType];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _selectedCard = [_presenter.selectedDeck cardAtIndex:(NSUInteger) indexPath.row];
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
    if ([item.title isEqualToString:@"Settings"]) {
        [self performSegueWithIdentifier:@"viewSettings" sender:self];
    }
    else {
        NSUInteger selectedIndex = [self.tabBar.items indexOfObject:self.tabBar.selectedItem];
        [_presenter selectDeckType:(DeckType)selectedIndex];
    }
}

@end
