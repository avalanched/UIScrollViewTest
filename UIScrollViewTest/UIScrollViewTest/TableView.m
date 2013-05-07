//
//  TableView.m
//  UIScrollViewTest
//
//  Created by Andy Jacobs on 07/05/13.
//
//

#import "TableView.h"

@implementation TableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.panGestureRecognizer.delegate = self;
        self.panGestureRecognizer.maximumNumberOfTouches = 1;
        self.panGestureRecognizer.minimumNumberOfTouches = 1;
    }
    return self;
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
