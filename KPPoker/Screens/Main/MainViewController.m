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

@interface MainViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cardTypeSegmentedControl;

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
    [self configureTitleView];
    [self configureCollectionView];
    [self configureSegmentedControl];
}

- (void)configureTitleView {
    UIImage *bannerImage = [UIImage imageNamed:@"banner"];
    UIImageView *bannerImageView = [[UIImageView alloc] initWithImage:bannerImage];
    self.navigationItem.titleView = bannerImageView;
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

- (IBAction)cardTypeChanged:(UISegmentedControl *)segmentedControl {
    [_presenter selectDeckType:self.cardTypeSegmentedControl.selectedSegmentIndex];
}

- (void)reloadCard {
    [self.collectionView reloadData];
}

@end
