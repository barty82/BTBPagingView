//
//  BTBPagingViewImagesItemTests.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import "BTBPagingViewImagesItem.h"


#pragma mark - Interface of 'BTBPagingViewImagesItemTests'

@interface BTBPagingViewImagesItemTests : XCTestCase

@end


#pragma mark - Implementation of 'BTBPagingViewImagesItemTests'

@implementation BTBPagingViewImagesItemTests
{
    BTBPagingViewImagesItem *_item;
    UIImageView *_rootImgView;
}

- (void)setUp
{
    [super setUp];

    CGRect rect = CGRectZero;
    _rootImgView = [[UIImageView alloc] init];

    _item = [[BTBPagingViewImagesItem alloc] initWithRootImageView:_rootImgView
                                                             index:0
                                                          andFrame:rect];
}

- (void)tearDown
{
    _item = nil;
    
    [super tearDown];
}


#pragma mark - Structural TESTs

- (void)testClassShouldContainsInitWithRootImageView
{
    BTBPagingViewImagesItem *item = [[BTBPagingViewImagesItem alloc] init];
    BOOL isAccessable = [item respondsToSelector:@selector(initWithRootImageView:index:andFrame:)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the constructor called initWithRootImageView:");
}

- (void)testClassShouldContainsImageItemsAsProperty
{
    BOOL isAccessable = [_item respondsToSelector:@selector(imageItems)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called 'imageViews'.");
}

- (void)testClassShouldContainsAnimationStartMethod
{
    BOOL isAccessable = [_item respondsToSelector:@selector(animationStart)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the method called 'animationStart'.");
}

- (void)testClassShouldContainsAnimationStop
{
    BOOL isAccessable = [_item respondsToSelector:@selector(animationStop)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the method called 'animationStop'.");
}

- (void)testClassShouldContainsDelegateAsProperty
{
    BOOL isAccessable = [_item respondsToSelector:@selector(delegate)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called 'delegate'.");
}

- (void)testClassShouldContainsMethodCalledTappedEventHandler
{
    BOOL isAccessable = [_item respondsToSelector:@selector(tappedEventHandler:)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the method called 'tappedEventHandler:'.");
}

- (void)testClassShouldContainsIndexAsProperty
{
    BOOL isAccessable = [_item respondsToSelector:@selector(index)];
    
    XCTAssertTrue(isAccessable, @"This class should contains the property called 'index'.");
}


#pragma mark - TESTs for 'initWithRootImageView:index:andFrame'

- (void)testInitWithRootImageViewShouldAddRootImageViewToImageItems
{
    id rootImageItem = [_item.imageItems firstObject];
    
    XCTAssertEqualObjects(_rootImgView, rootImageItem, @"The initiated instance should contains property with rootImageItem in the first place of imageItems.");
}

- (void)testInitWithRootImageViewShouldAddRootImageView
{
    XCTAssertTrue(_item.subviews.count > 0, @"This method should add rootImageView as subView.");
}

- (void)testInitWithRootImageViewShouldThrowIfNilParameterPassedForRootImageView
{
    XCTAssertThrows([[BTBPagingViewImagesItem alloc] initWithRootImageView:nil index:0 andFrame:CGRectZero], @"This method should throw exception if nil value passed in for rootImageView.");
    
}


@end
