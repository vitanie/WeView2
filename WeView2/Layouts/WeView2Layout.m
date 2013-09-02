//
//  WeView2Layout.m
//  Unknown Project
//
//  Copyright (c) 2013 Charles Matthew Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UIView+WeView2.h"
#import "WeView2LinearLayout.h"
#import "WeView2Macros.h"

@interface WeView2Layout ()
{
/* CODEGEN MARKER: Members Start */

NSNumber *_leftMargin;
NSNumber *_rightMargin;
NSNumber *_topMargin;
NSNumber *_bottomMargin;

NSNumber *_vSpacing;
NSNumber *_hSpacing;

NSNumber *_contentHAlign;
NSNumber *_contentVAlign;

NSNumber *_cropSubviewOverflow;

NSNumber *_debugLayout;
NSNumber *_debugMinSize;

/* CODEGEN MARKER: Members End */
}

@end

#pragma mark -

@implementation WeView2Layout

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)dealloc
{
}

- (void)layoutContentsOfView:(UIView *)view
                    subviews:(NSArray *)subviews
{
    assert(0);
}

- (CGSize)minSizeOfContentsView:(UIView *)view
                       subviews:(NSArray *)subviews
                   thatFitsSize:(CGSize)guideSize
{
    assert(0);
    return CGSizeZero;
}

#pragma mark - Per-Layout Properties

/* CODEGEN MARKER: Accessors Start */

- (CGFloat)leftMargin:(UIView *)view
{
    if (_leftMargin)
    {
        return [_leftMargin floatValue];
    }
    return [view leftMargin];
}

- (WeView2Layout *)setLeftMargin:(CGFloat)value
{
    _leftMargin = @(value);
    return self;
}

- (CGFloat)rightMargin:(UIView *)view
{
    if (_rightMargin)
    {
        return [_rightMargin floatValue];
    }
    return [view rightMargin];
}

- (WeView2Layout *)setRightMargin:(CGFloat)value
{
    _rightMargin = @(value);
    return self;
}

- (CGFloat)topMargin:(UIView *)view
{
    if (_topMargin)
    {
        return [_topMargin floatValue];
    }
    return [view topMargin];
}

- (WeView2Layout *)setTopMargin:(CGFloat)value
{
    _topMargin = @(value);
    return self;
}

- (CGFloat)bottomMargin:(UIView *)view
{
    if (_bottomMargin)
    {
        return [_bottomMargin floatValue];
    }
    return [view bottomMargin];
}

- (WeView2Layout *)setBottomMargin:(CGFloat)value
{
    _bottomMargin = @(value);
    return self;
}

- (CGFloat)vSpacing:(UIView *)view
{
    if (_vSpacing)
    {
        return [_vSpacing floatValue];
    }
    return [view vSpacing];
}

- (WeView2Layout *)setVSpacing:(CGFloat)value
{
    _vSpacing = @(value);
    return self;
}

- (CGFloat)hSpacing:(UIView *)view
{
    if (_hSpacing)
    {
        return [_hSpacing floatValue];
    }
    return [view hSpacing];
}

- (WeView2Layout *)setHSpacing:(CGFloat)value
{
    _hSpacing = @(value);
    return self;
}

- (HAlign)contentHAlign:(UIView *)view
{
    if (_contentHAlign)
    {
        return [_contentHAlign intValue];
    }
    return [view contentHAlign];
}

- (WeView2Layout *)setContentHAlign:(HAlign)value
{
    _contentHAlign = @(value);
    return self;
}

- (VAlign)contentVAlign:(UIView *)view
{
    if (_contentVAlign)
    {
        return [_contentVAlign intValue];
    }
    return [view contentVAlign];
}

- (WeView2Layout *)setContentVAlign:(VAlign)value
{
    _contentVAlign = @(value);
    return self;
}

- (BOOL)cropSubviewOverflow:(UIView *)view
{
    if (_cropSubviewOverflow)
    {
        return [_cropSubviewOverflow boolValue];
    }
    return [view cropSubviewOverflow];
}

- (WeView2Layout *)setCropSubviewOverflow:(BOOL)value
{
    _cropSubviewOverflow = @(value);
    return self;
}

- (BOOL)debugLayout:(UIView *)view
{
    if (_debugLayout)
    {
        return [_debugLayout boolValue];
    }
    return [view debugLayout];
}

- (WeView2Layout *)setDebugLayout:(BOOL)value
{
    _debugLayout = @(value);
    return self;
}

- (BOOL)debugMinSize:(UIView *)view
{
    if (_debugMinSize)
    {
        return [_debugMinSize boolValue];
    }
    return [view debugMinSize];
}

- (WeView2Layout *)setDebugMinSize:(BOOL)value
{
    _debugMinSize = @(value);
    return self;
}

- (WeView2Layout *)setHMargin:(CGFloat)value
{
    [self setLeftMargin:value];
    [self setRightMargin:value];
    return self;
}

- (WeView2Layout *)setVMargin:(CGFloat)value
{
    [self setTopMargin:value];
    [self setBottomMargin:value];
    return self;
}

- (WeView2Layout *)setMargin:(CGFloat)value
{
    [self setLeftMargin:value];
    [self setRightMargin:value];
    [self setTopMargin:value];
    [self setBottomMargin:value];
    return self;
}

- (WeView2Layout *)setSpacing:(CGFloat)value
{
    [self setHSpacing:value];
    [self setVSpacing:value];
    return self;
}

/* CODEGEN MARKER: Accessors End */

#pragma mark - Utility Methods

- (void)positionSubview:(UIView *)subview
            inSuperview:(UIView *)superview
               withSize:(CGSize)subviewSize
           inCellBounds:(CGRect)cellBounds
{
    if (subview.hStretchWeight > 0)
    {
        subviewSize.width = cellBounds.size.width;
    }
    if (subview.vStretchWeight > 0)
    {
        subviewSize.height = cellBounds.size.height;
    }

    subviewSize = CGSizeMax(CGSizeZero, CGSizeFloor(subviewSize));
    subview.frame = alignSizeWithinRect(subviewSize,
                                        cellBounds,
                                        superview.cellHAlign,
                                        superview.cellVAlign);
}

- (CGPoint)insetOriginOfView:(UIView *)view
{
    return [self contentBoundsOfView:view
                             forSize:view.size].origin;
}

- (CGRect)contentBoundsOfView:(UIView *)view
                      forSize:(CGSize)size
{
    CGFloat borderWidth = view.layer.borderWidth;

    int left = ceilf([self leftMargin:view] + borderWidth);
    int top = ceilf([self topMargin:view] + borderWidth);
    int right = floorf(size.width - ceilf([self rightMargin:view] + borderWidth));
    int bottom = floorf(size.height - ceilf([self bottomMargin:view] + borderWidth));

    return CGRectMake(left,
                      top,
                      MAX(0, right - left),
                      MAX(0, bottom - top));
}

- (CGSize)insetSizeOfView:(UIView *)view
{
    CGFloat borderWidth = view.layer.borderWidth;

    int left = ceilf([self leftMargin:view] + borderWidth);
    int top = ceilf([self topMargin:view] + borderWidth);
    int right = ceilf([self rightMargin:view] + borderWidth);
    int bottom = ceilf([self bottomMargin:view] + borderWidth);

    return CGSizeMake(left + right, top + bottom);
}

- (CGSize)desiredItemSize:(UIView *)subview
                  maxSize:(CGSize)maxSize
{
    if (subview.ignoreDesiredSize)
    {
        return CGSizeZero;
    }

    return CGSizeMax(CGSizeZero,
                     CGSizeCeil(CGSizeMax(subview.minSize,
                                          CGSizeMin(subview.maxSize,
                                                    [subview sizeThatFits:maxSize]))));
}

@end
