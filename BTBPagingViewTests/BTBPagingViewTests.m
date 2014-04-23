//
//  BTBPagingViewTests.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 . All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import "BTBPagingView.h"
#import "MockPagingDataSource.h"


#pragma mark - Interface extension of 'BTBPagingView'

@interface BTBPagingView ()

- (void)addItemToScrollViewOnMainThread;
- (void)bootupUIonMainThread;

@end


#pragma mark - Interface of 'BTBPagingViewTests'

@interface BTBPagingViewTests : XCTestCase
@end


#pragma mark - Implementation of 'BTBPagingViewTests'

@implementation BTBPagingViewTests
{
    BTBPagingView *_view;
}

- (void)setUp
{
    [super setUp];
    
    CGRect rect = CGRectMake(0, 0, 320, 400);
    _view = [[BTBPagingView alloc] initWithFrame:rect];
}

- (void)tearDown
{
    _view = nil;

    [super tearDown];
}


#pragma mark - Structural TESTs

- (void)testClassContainsMethodCalledRefreshView
{
    BOOL isAccessable = [_view respondsToSelector:@selector(refreshView)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the method called refreshView.");
}

- (void)testClassShouldContainsPropertyCalledDelegate
{
    BOOL isAccessable = [_view respondsToSelector:@selector(delegate)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called delegate.");
}

- (void)testClassShouldContainsPropertyCalledDataSource
{
    BOOL isAccessable = [_view respondsToSelector:@selector(dataSource)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called dataSource.");
}

- (void)testClassShouldContainsProtocolMethodCalledPagingItemDidTapAtIndex
{
    BOOL isAccessable = [_view respondsToSelector:@selector(pagingItem:didTapAtIndex:)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called pagingItem:didTapAtIndex:.");
}

- (void)testClassShouldContainsProtocolMethodCalledRefreshView
{
    BOOL isAccessable = [_view respondsToSelector:@selector(refreshView)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called 'refreshView'.");
}

- (void)testClassShouldContainsProtocolMethodCalledAddItemToScrollViewOnMainThread
{
    BOOL isAccessable = [_view respondsToSelector:@selector(addItemToScrollViewOnMainThread)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called 'addItemToScrollViewOnMainThread'.");
}


#pragma mark - bootupUIonMainThread

- (void)testBootupUIonMainThreadShouldAddScrollerViewTypeOfObjectBeAddedIntoItsView
{
    [_view bootupUIonMainThread];
    
    id firstView = [_view.subviews firstObject];
    
    XCTAssertTrue([firstView isKindOfClass:[UIScrollView class]], @"This method should contains type of UIScrollView object in first place in subview.");
}

- (void)testBootupUIonMainThreadShouldAddPageControlTypeOfObjectBeAddedIntoItsView
{
    [_view bootupUIonMainThread];
    
    id secondView = _view.subviews[1];
    
    XCTAssertNotNil(secondView, @"This method should initiate pageControl and add it into subview of its view");
    
    XCTAssertTrue([secondView isKindOfClass:[UIPageControl class]], @"And this method should initiate UIPageControl type of object into subview");
}


#pragma mark - TESTs for DataSource protocoal

- (void)testDataSourceShouldAbleToAccessToMethodCalledPagingViewItemAtIndex
{
    id aMock = [OCMockObject mockForProtocol:@protocol(BTBPagingViewDataSource)];
    
    BOOL isAccessable = [aMock respondsToSelector:@selector(pagingView:itemAtIndex:)];
    
    XCTAssertTrue(isAccessable, @"This protocol should declare the method called pagingView:itemAtIndex:");
}

- (void)testDataSourceShouldAbleToAccessToMethodCalledNumberOfPagingItems
{
    id aMock = [OCMockObject mockForProtocol:@protocol(BTBPagingViewDataSource)];
    
    BOOL isAccessable = [aMock respondsToSelector:@selector(numberOfPagingItems)];
    
    XCTAssertTrue(isAccessable, @"This protocol should declare the method called 'numberOfPagingItems'. ");
}


#pragma mark - TESTs for Delegate protocoal

- (void)testDelegateShouldAbleToAccessToMethodCalledPagingViewDidSelectAtIndex
{
    id aMock = [OCMockObject mockForProtocol:@protocol(BTBPagingViewDelegate)];
    
    BOOL isAccessable = [aMock respondsToSelector:@selector(pagingView:didSelectAtIndex:)];
    
    XCTAssertTrue(isAccessable, @"This protocol should declare the method called 'pagingView:didSelectAtIndex:'. ");
}


#pragma mark - TESTs for 'refreshView'

- (void)testRefreshViewShouldCallProtocolMethodCalledRefreshViewFromDataSource
{
    MockPagingDataSource *ds = [[MockPagingDataSource alloc] init];
    
    id mockDataSource = [OCMockObject partialMockForObject:ds];
    
    _view.dataSource = mockDataSource;
    
    [[mockDataSource expect] numberOfPagingItems];
    
    [_view refreshView];
    
    [mockDataSource verify];
}

//- (void)testRefreshViewShouldSetContentViewOfScrollViewWithNumberOfItems
//{
//    MockPagingDataSource *dataSource = [[MockPagingDataSource alloc] init];
//    _view.dataSource = dataSource;
//    [_view refreshView];
//
//    UIScrollView *scrollView = nil;
//    for (UIView *view in _view.subviews)
//    {
//        if (![view isKindOfClass:[UIScrollView class]])
//            continue;
//        
//        scrollView = (UIScrollView *)view;
//    }
//    
//    float widthOfContentView = 320 * 2;
//    
//    XCTAssertEqual(scrollView.contentSize.width, widthOfContentView, @"This method should set the contentsSize of scrollView with numberOfItems times the width of view.");
//}
//
//- (void)testRefreshViewShouldAddPagingItemIntoRightPlace
//{
//    CGRect rect = CGRectMake(0, 0, 320, 400);
//    MockPagingDataSource *dataSource = [[MockPagingDataSource alloc]
//                                        initWithFrame:rect];
//    _view.dataSource = dataSource;
//    [_view refreshView];
//    
//    UIScrollView *scrollView = nil;
//    for (UIView *view in _view.subviews)
//    {
//        if (![view isKindOfClass:[UIScrollView class]])
//            continue;
//        
//        scrollView = (UIScrollView *)view;
//    }
//    
//    BTBPagingViewItem *secondItem = scrollView.subviews[1];
//    
//    XCTAssertEqual(320, secondItem.frame.origin.x, @"Due to setting the second pagingItem in right next first item so second item must be placed 320 for x value.");
//}

- (void)testRefreshViewShouldCalledAddItemToScrollViewOnMainThread
{
    CGRect rect = CGRectMake(0, 0, 320, 400);
    MockPagingDataSource *dataSource = [[MockPagingDataSource alloc]
                                        initWithFrame:rect];
    _view.dataSource = dataSource;
    
    id mockView = [OCMockObject partialMockForObject:_view];
    
    [[mockView stub] addItemToScrollViewOnMainThread];
    
    [mockView refreshView];
}


#pragma mark - TESTs for 'addItemToScrollViewOnMainThread'

//- (void)testAddItemToScrollViewShouldCallProtocolNumberOfTime
//{
//    CGRect rect = CGRectMake(0, 0, 320, 400);
//    MockPagingDataSource *dataSource = [[MockPagingDataSource alloc]
//                                        initWithFrame:rect];
//    _view.dataSource = dataSource;
//    [_view refreshView];
//    [_view addItemToScrollViewOnMainThread];
//    
//    UIScrollView *scrollView = nil;
//    for (UIView *view in _view.subviews)
//    {
//        if (![view isKindOfClass:[UIScrollView class]])
//            continue;
//        
//        scrollView = (UIScrollView *)view;
//    }
//    
//    XCTAssertEqual(scrollView.subviews.count, 2, @"This method should add the BTBPagingViewItems which got this from the protocol method of datasource into scrollView as subViews.");
//}

@end
