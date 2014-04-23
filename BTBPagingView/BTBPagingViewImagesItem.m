//
//  BTBPagingViewImagesItem.m
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

#import "BTBPagingViewImagesItem.h"


#pragma mark - Interface extension of 'BTBPagingViewImagesItem'

@interface BTBPagingViewImagesItem()

@property(nonatomic, readwrite, strong) NSArray *imageItems;

@end


#pragma mark - Implementation of 'BTBPagingViewImagesItem'

@implementation BTBPagingViewImagesItem
{
    UITapGestureRecognizer *_tapGestureRecognizer;
}

- (instancetype)initWithRootImageView:(UIImageView *)rootImageView
                                index:(NSInteger)index
                             andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _index = index;
        _imageItems = [NSMutableArray arrayWithObject:rootImageView];
        [self addSubview:rootImageView];
    
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(tappedEventHandler:)];
        
        [self addGestureRecognizer:_tapGestureRecognizer];
    }
    
    return self;
}


#pragma mark - Protocol of 'IBTBTappable'

- (void)tappedEventHandler:(id)sender
{
    if (!self.delegate)
        return;
    
    [self.delegate pagingItem:self didTapAtIndex:_index];
}


#pragma mark - Protocol of 'IBTBAnimatable'

- (void)animationStart
{
    
}

- (void)animationStop
{
    
}


@end
