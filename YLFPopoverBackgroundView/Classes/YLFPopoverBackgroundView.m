//
//  YLFPopoverBackgroundView.m
//  YLFPopoverBackgroundView
//
//  Created by yleaf on 2018/9/22.
//

#import "YLFPopoverBackgroundView.h"
#import "UIImage+YLFCorner.h"

@implementation YLFCustomPopoverAppearance

static CGFloat kCornerRadius = 15;

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *backgroundImage = [[UIImage imageWithSize:CGSizeMake(100, 100) cornerRadius:kCornerRadius] resizableImageWithCapInsets:UIEdgeInsetsMake(kCornerRadius, kCornerRadius, kCornerRadius, kCornerRadius)];
        _backgroundImageV = [[UIImageView alloc] initWithImage:backgroundImage];
        _arrowImage = [UIImage imageNamed:@""];
        _wantsDefaultContentAppearance = YES;
    }
    return self;
}

@end

@interface YLFPopoverBackgroundView ()

@property (nonatomic, strong) UIImageView *backgroundImageV;
@property (nonatomic, strong) UIImageView *arrowImageV;

@end

@implementation YLFPopoverBackgroundView

#pragma mark - UIPopoverBackgroundViewMethods

+ (UIEdgeInsets)contentViewInsets
{
    return [self customAppearance].contentViewInsets;
}

+ (CGFloat)arrowHeight
{
    return [self customAppearance].arrowImage.size.height;
}

+ (CGFloat)arrowBase
{
    return [self customAppearance].arrowImage.size.width;
}

#pragma mark - Class Property

static YLFCustomPopoverAppearance *_customAppearance = nil;

+ (void)setCustomAppearance:(YLFCustomPopoverAppearance *)customAppearance
{
    _customAppearance = customAppearance;
}

+ (YLFCustomPopoverAppearance *)customAppearance
{
    if (!_customAppearance) {
        _customAppearance = [[YLFCustomPopoverAppearance alloc] init];
    }
    return _customAppearance;
}

#pragma mark - INITIALIZER

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Instance Methods

- (void)setup
{
    self.backgroundImageV = [[self class] customAppearance].backgroundImageV;
    self.arrowImageV = [[UIImageView alloc] initWithImage:[[self class] customAppearance].arrowImage];
    self.arrowOffset = [[self class] customAppearance].arrowOffset;
    [self addSubview:self.backgroundImageV];
    [self addSubview:self.arrowImageV];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bgRect = self.bounds;
    
    BOOL cutWidth = (self.arrowDirection == UIPopoverArrowDirectionLeft || self.arrowDirection == UIPopoverArrowDirectionRight);
    bgRect.size.width -= cutWidth * [self.class arrowHeight];
    BOOL cutHeight = (self.arrowDirection == UIPopoverArrowDirectionUp || self.arrowDirection == UIPopoverArrowDirectionDown);
    bgRect.size.height -= cutHeight * [self.class arrowHeight];

    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        bgRect.origin.y += [self.class arrowHeight];
    } else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        bgRect.origin.x += [self.class arrowHeight];
    }

    _backgroundImageV.frame = bgRect;
    
    CGRect arrowRect = CGRectZero;
    UIEdgeInsets contentViewInsets = [self.class contentViewInsets];
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
        {
            arrowRect = _arrowImageV.frame;
            arrowRect.origin.x = self.bounds.size.width / 2 - arrowRect.size.width / 2 + self.arrowOffset;
            arrowRect.origin.y = 0;
            break;
        }
        case UIPopoverArrowDirectionDown:
        {
            _arrowImageV.transform = CGAffineTransformMakeScale(1, -1);  // flip vertically
            arrowRect = _arrowImageV.frame;  // get frame after (!) transformation
            arrowRect.origin.x = self.bounds.size.width / 2 - arrowRect.size.width / 2 + self.arrowOffset;
            arrowRect.origin.y = self.bounds.size.height - arrowRect.size.height;
            break;
        }
        case UIPopoverArrowDirectionLeft:
        {
            _arrowImageV.transform = CGAffineTransformMakeRotation(-M_PI_2); // rotate counter clock-wise
            arrowRect = _arrowImageV.frame;
            arrowRect.origin.x = 0;
            arrowRect.origin.y = self.bounds.size.height / 2 - arrowRect.size.height / 2 + self.arrowOffset;
            arrowRect.origin.y = fminf(self.bounds.size.height - arrowRect.size.height - contentViewInsets.bottom, arrowRect.origin.y);
            arrowRect.origin.y = fmaxf(contentViewInsets.top, arrowRect.origin.y);
            break;
        }
        case UIPopoverArrowDirectionRight:
        {
            _arrowImageV.transform = CGAffineTransformMakeRotation(M_PI_2);  // rotate clock-wise
            arrowRect = _arrowImageV.frame;
            arrowRect.origin.x = self.bounds.size.width - arrowRect.size.width;
            arrowRect.origin.y = self.bounds.size.height / 2 - arrowRect.size.height / 2 + self.arrowOffset;
            arrowRect.origin.y = fminf(self.bounds.size.height - arrowRect.size.height  - contentViewInsets.bottom, arrowRect.origin.y);
            arrowRect.origin.y = fmaxf(contentViewInsets.top, arrowRect.origin.y);
            break;
        }
        default:
            break;
    }
    _arrowImageV.frame = arrowRect;
}

#pragma mark - Overrider

@synthesize arrowDirection;

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection1
{
    arrowDirection = arrowDirection1;
    [self setNeedsLayout];
}

@synthesize arrowOffset;

- (void)setArrowOffset:(CGFloat)arrowOffset1
{
    arrowOffset = arrowOffset1;
    [self setNeedsLayout];
}

- (BOOL)wantsDefaultContentAppearance
{
    return self.class.wantsDefaultContentAppearance;
}

@end
