//
//  BTBPagingView.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

#import "BTBPagingView.h"


#pragma mark - Interface extension of 'BTBPagingView'

@interface BTBPagingView ()<UIScrollViewDelegate>

- (void)addItemToScrollViewOnMainThread;
- (void)bootupUIonMainThread;

@end


#pragma mark - Implementation of 'BTBPagingView'

@implementation BTBPagingView
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSInteger _numberOfItems;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 1;
        
        [self performSelectorOnMainThread:@selector(bootupUIonMainThread)
                               withObject:nil
                            waitUntilDone:NO];
    }
    return self;
}


#pragma mark - Protocol of 'IBTBRefreshable'

- (void)refreshView
{
    //#1. Get Number of items
    if (!self.dataSource)
        return;
    
    _numberOfItems = [self.dataSource numberOfPagingItems];
    
    [self performSelectorOnMainThread:@selector(addItemToScrollViewOnMainThread)
                           withObject:nil
                        waitUntilDone:NO];
}


#pragma mark - Protocol of 'UIScrollViewDelegate'

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    _pageControl.currentPage = page;
    
    if (!self.delegate)
        return;
    
    [self.delegate pagingView:self didChangeViewToIndex:page];
}


#pragma mark - Protocol of 'BTBPagingViewImagesItemDelegate'

- (void)pagingItem:(BTBPagingViewItem *)pagingItem didTapAtIndex:(NSInteger)index
{
    if (!self.delegate)
        return;
    
    [self.delegate pagingView:self didSelectAtIndex:index];
}


#pragma mark - Private method

- (void)bootupUIonMainThread
{
    UIView *superView = self;
    
    //#1. UIScrollView
    [self addSubview:_scrollView];
 
    //#2. UIPageControl
    [self addSubview:_pageControl];
    
    [_pageControl setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *verticalCon = [NSLayoutConstraint
                                           constraintWithItem:_pageControl
                                           attribute:NSLayoutAttributeCenterX
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:superView
                                           attribute:NSLayoutAttributeCenterX
                                           multiplier:1.0
                                           constant:0];
    [superView addConstraint:verticalCon];
    
    NSLayoutConstraint *horizonCon = [NSLayoutConstraint
                                       constraintWithItem:_pageControl
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:superView
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0
                                       constant:0];

    [superView addConstraint:horizonCon];
    
}

- (void)addItemToScrollViewOnMainThread
{
    //#1. Get each item of 'BTBPagingViewImagesItem' at index And add to ScrollView
    for (int i = 0; i < _numberOfItems; i++)
    {
        BTBPagingViewItem *item = [self.dataSource pagingView:self
                                                  itemAtIndex:i];
        [item setDelegate:self];
        
        //A. decide the x-axis of item's location.
        float newXPos = i * self.frame.size.width;
        
        CGRect newRec = CGRectMake(newXPos, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        [item setFrame:newRec];
        
        [_scrollView addSubview:item];
    }
    
    //#2. Set ContentSize of scrollView
    float width = self.frame.size.width * _numberOfItems;
    CGSize cSize = CGSizeMake(width, self.frame.size.height);
    [_scrollView setContentSize:cSize];
    
    //#3. Set pageControl
    _pageControl.numberOfPages = _numberOfItems;
    
    //#4.
    [self.delegate pagingViewDidFinishLoad:self];
}

@end
