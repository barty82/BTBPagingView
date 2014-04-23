//
//  BTBPagingView.h
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

@import UIKit;
#import "BTBPagingViewItem.h"
#import "IBTBRefreshable.h"


#pragma mark - Class Declation

@class BTBPagingView;


#pragma mark - DataSource

@protocol BTBPagingViewDataSource <NSObject>

@required

- (BTBPagingViewItem *)pagingView:(BTBPagingView *)pagingView
                      itemAtIndex:(NSInteger)index;

- (NSInteger)numberOfPagingItems;

@end


#pragma mark - Delegate

@protocol BTBPagingViewDelegate <NSObject>

@optional

- (void)pagingViewDidFinishLoad:(BTBPagingView *)pagingView;

- (void)pagingView:(BTBPagingView *)pagingView didChangeViewToIndex:(NSInteger)index;

- (void)pagingView:(BTBPagingView *)pagingView didSelectAtIndex:(NSInteger)index;

@end


#pragma mark - INTERFACE of 'BTBPagingView'

@interface BTBPagingView : UIView <IBTBRefreshable, BTBPagingViewItemDelegate>

@property(nonatomic, strong) id<BTBPagingViewDelegate> delegate;
@property(nonatomic, strong) id<BTBPagingViewDataSource> dataSource;


@end
