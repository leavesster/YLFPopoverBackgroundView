//
//  YLFPopoverBackgroundView.h
//  YLFPopoverBackgroundView
//
//  Created by yleaf on 2018/9/22.
//

#import <UIKit/UIKit.h>

@interface YLFCustomPopoverAppearance : NSObject

@property (nonatomic, assign) UIEdgeInsets contentViewInsets;
@property (nonatomic, strong) UIImageView *backgroundImageV;
@property (nonatomic, strong) UIImage *arrowImage;
@property (nonatomic, assign) CGFloat arrowOffset;
@property (nonatomic, assign) BOOL wantsDefaultContentAppearance;

@end

@interface YLFPopoverBackgroundView : UIPopoverBackgroundView

@property (class, nonatomic, copy) YLFCustomPopoverAppearance *customAppearance;

@end
