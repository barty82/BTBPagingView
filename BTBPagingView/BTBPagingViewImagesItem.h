//
//  BTBPagingViewImagesItem.h
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

#import "BTBPagingViewItem.h"
#import "IBTBAnimatable.h"
#import "IBTBTappable.h"


#pragma mark - Interface of 'BTBPagingViewImagesItem'

@interface BTBPagingViewImagesItem : BTBPagingViewItem <IBTBAnimatable, IBTBTappable>

@property(nonatomic, readonly, strong) NSArray *imageItems;
@property(nonatomic, assign) NSInteger index;

- (instancetype)initWithRootImageView:(UIImageView *)rootImageView
                                index:(NSInteger)index
                             andFrame:(CGRect)frame;

@end
