//
//  DemoModel.m
//  WeViews2DemoApp
//
//  Copyright (c) 2013 Charles Matthew Chen. All rights reserved.
//
//  Distributed under the Apache License v2.0.
//  http://www.apache.org/licenses/LICENSE-2.0.html
//

#import "DemoModel.h"
#import "WeViewDemoConstants.h"

@implementation DemoModel

+ (DemoModel *)create
{
    DemoModel* result = [[DemoModel alloc] init];
    result.rootView = [[WeView alloc] init];

    return result;
}

- (void)setSelection:(id)value
{
    if (_selection == value)
    {
        return;
    }
    _selection = value;

    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SELECTION_CHANGED
                                                        object:_selection];
    [self.delegate selectionChanged:self.selection];
}

- (NSArray *)collectSubviews:(UIView *)view
{
    NSMutableArray *result = [NSMutableArray array];
    [result addObject:view];
    for (UIView *subview in view.subviews)
    {
        [result addObjectsFromArray:[self collectSubviews:subview]];
    }
    return result;
}

@end
