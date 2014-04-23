//
//  IBTBTappable.h
//  BTBPagingView
//
//  Created by Barty Kim on 2/19/14.
//  Copyright (c) 2014 Bartysways. All rights reserved.
//

@import Foundation;

@protocol IBTBTappable <NSObject>

@required

- (void)tappedEventHandler:(id)sender;

@end
