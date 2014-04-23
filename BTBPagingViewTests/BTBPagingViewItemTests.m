//
//  BTBPagingViewItemTests.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/20/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import "BTBPagingViewItem.h"

#pragma mark - Interface of 'BTBPagingViewItemTests'

@interface BTBPagingViewItemTests : XCTestCase

@end


#pragma mark - Implementation of 'BTBPagingViewItemTests'

@implementation BTBPagingViewItemTests
{
    BTBPagingViewItem *_item;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    _item = nil;
    
    [super tearDown];
}


#pragma mark - TESTs for 'BTBPagingViewImagesItemDelegate' protocol

- (void)testBTBPagingViewImagesItemDelegateShouldHavePagingItemDidTapAtIndex
{
    id aMock = [OCMockObject mockForProtocol:@protocol(BTBPagingViewItemDelegate)];
    
    BOOL isAccessable = [aMock respondsToSelector:@selector(pagingItem:didTapAtIndex:)];
    
    XCTAssertTrue(isAccessable, @"This protocol should declare the method called 'pagingItem:didTapAtIndex:'. ");
}

@end
