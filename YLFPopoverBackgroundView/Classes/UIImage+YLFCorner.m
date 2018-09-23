//
//  UIImage+YLFCorner.m
//  YLFPopoverBackgroundView
//
//  Created by yleaf on 2018/9/23.
//

#import "UIImage+YLFCorner.h"

@implementation UIImage (YLFCorner)

+ (instancetype)imageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    NSAssert(!CGSizeEqualToSize(size, CGSizeZero), @"Size cannot be CGSizeZero");
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [[UIBezierPath bezierPathWithRoundedRect:rect
                                cornerRadius:cornerRadius] addClip];

    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (instancetype)redrawImageWithColor:(UIColor *)color
{
    NSParameterAssert(color);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = (CGRect){CGPointZero, self.size};
    
    // do a vertical flip so that image is correct
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, bounds.size.height);
    CGContextConcatCTM(ctx, flipVertical);
    
    // create mask of image
    CGContextClipToMask(ctx, bounds, self.CGImage);
    [color setFill];
    CGContextFillRect(ctx, bounds);
    
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

@end
