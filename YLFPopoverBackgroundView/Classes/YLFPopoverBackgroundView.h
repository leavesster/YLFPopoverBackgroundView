//
//  YLFPopoverBackgroundView.h
//  YLFPopoverBackgroundView
//
//  Created by yleaf on 2018/9/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLFCustomPopoverAppearance : NSObject

@property (nonatomic, assign) UIEdgeInsets contentViewInsets;
@property (nonatomic, strong, null_resettable) UIImageView *backgroundImageV;
@property (nonatomic, strong, null_resettable) UIImage *arrowImage;
@property (nonatomic, assign) CGFloat arrowOffset;

@end

@interface YLFPopoverBackgroundView : UIPopoverBackgroundView

@property (class, nonatomic, copy, null_resettable) YLFCustomPopoverAppearance *customAppearance;

@end

@interface YLFPopoverNoShadowBackgroundView : YLFPopoverBackgroundView
@end

NS_ASSUME_NONNULL_END
