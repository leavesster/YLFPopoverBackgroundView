//
//  UIImage+YLFCorner.h
//  YLFPopoverBackgroundView
//
//  Created by yleaf on 2018/9/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLFCorner)

+ (instancetype)imageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

- (instancetype)redrawImageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
