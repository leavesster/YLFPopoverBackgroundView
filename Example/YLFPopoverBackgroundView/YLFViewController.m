//
//  YLFViewController.m
//  YLFPopoverBackgroundView
//
//  Created by leavesster on 09/22/2018.
//  Copyright (c) 2018 leavesster. All rights reserved.
//

#import "YLFViewController.h"

@interface YLFViewController ()<UIPopoverPresentationControllerDelegate>

@property (nonatomic, assign) NSInteger count;

@end

@import YLFPopoverBackgroundView;

@implementation YLFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:NSLocalizedString(@"Popover", nil) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popover:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

- (void)popover:(UIButton *)btn
{
    UIViewController *vc = [[UIViewController alloc] init];
    [self showPopoverViewController:vc sourceView:btn];
}


#pragma mark - UIPopoverPresentationController & Delegate
- (void)showPopoverViewController:(UIViewController *)vc sourceView:(UIView *)sourceView
{
    vc.preferredContentSize = CGSizeMake(100, 60);
    vc.view.backgroundColor = [UIColor brownColor];
    
    vc.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *present = vc.popoverPresentationController;
    YLFCustomPopoverAppearance *appearance = YLFPopoverBackgroundView.customAppearance;
    appearance.wantsDefaultContentAppearance = NO;
    
    NSBundle *bundle = [NSBundle bundleForClass:[YLFPopoverBackgroundView class]];
    NSURL *bundleURL = [[bundle resourceURL] URLByAppendingPathComponent:@"YLFPopoverBackgroundView.bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:bundleURL];
    UIImage *arrowImage = [UIImage imageNamed:@"arrow" inBundle:resourceBundle compatibleWithTraitCollection:nil];
    appearance.arrowImage = [arrowImage redrawImageWithColor:[UIColor brownColor]];
//    appearance.contentViewInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    vc.popoverPresentationController.popoverBackgroundViewClass = [YLFPopoverNoShadowBackgroundView class];
    present.permittedArrowDirections = 1 << (self.count % 4);
    present.delegate = self;
    present.sourceView = sourceView;
    present.sourceRect = sourceView.bounds;
    [self presentViewController:vc animated:YES completion:nil];
    self.count ++;
}

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
    popoverPresentationController.backgroundColor = [UIColor orangeColor];
    popoverPresentationController.containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    return YES;
}


@end
