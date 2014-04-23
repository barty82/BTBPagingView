//
//  MockPagingDataSource.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/20/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

#import "MockPagingDataSource.h"
#import "BTBPagingViewImagesItem.h"

@implementation MockPagingDataSource

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

    }
    return self;
}

#pragma mark - Protocol of 'BTBPagingViewDataSource'

- (BTBPagingViewImagesItem *)pagingView:(BTBPagingView *)pagingView
                            itemAtIndex:(NSInteger)index
{
    CGRect rect = self.bounds;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    
    return [[BTBPagingViewImagesItem alloc]
            initWithRootImageView:imageView
            index:index
            andFrame:rect];
}

- (NSInteger)numberOfPagingItems
{
    return 2;
}

@end
