//
//  BTBPagingViewItem.h
//  BTBPagingView
//
//  Created by Barty Kim on 2/20/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

@import UIKit;


@class BTBPagingViewItem;

#pragma mark - Protocol

@protocol BTBPagingViewItemDelegate <NSObject>

@required

- (void)pagingItem:(BTBPagingViewItem *)pagingItem didTapAtIndex:(NSInteger)index;

@end


#pragma mark - Interface of 'BTBPagingViewItem'

@interface BTBPagingViewItem : UIView

@property(nonatomic, strong) id<BTBPagingViewItemDelegate>delegate;

@end
