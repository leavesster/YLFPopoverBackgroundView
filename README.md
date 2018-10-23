# YLFPopoverBackgroundView

[![CI Status](https://img.shields.io/travis/leavesster/YLFPopoverBackgroundView.svg?style=flat)](https://travis-ci.org/leavesster/YLFPopoverBackgroundView)
[![Version](https://img.shields.io/cocoapods/v/YLFPopoverBackgroundView.svg?style=flat)](https://cocoapods.org/pods/YLFPopoverBackgroundView)
[![License](https://img.shields.io/cocoapods/l/YLFPopoverBackgroundView.svg?style=flat)](https://cocoapods.org/pods/YLFPopoverBackgroundView)
[![Platform](https://img.shields.io/cocoapods/p/YLFPopoverBackgroundView.svg?style=flat)](https://cocoapods.org/pods/YLFPopoverBackgroundView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### How to use

use UIPopoverPresentationController as normal, just add :

```vc.popoverPresentationController.popoverBackgroundViewClass = [YLFPopoverNoShadowBackgroundView class];```

```Objective-C
@import YLFPopoverBackgroundView;
...

- (void)showPopoverViewController:(UIViewController *)vc sourceView:(UIView *)sourceView
{
    vc.preferredContentSize = CGSizeMake(100, 60);
    vc.view.backgroundColor = [UIColor brownColor];
    
    vc.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *present = vc.popoverPresentationController;
    // just one line code
    vc.popoverPresentationController.popoverBackgroundViewClass = [YLFPopoverNoShadowBackgroundView class];
    present.delegate = self;
    present.sourceView = sourceView;
    present.sourceRect = sourceView.bounds;
    [self presentViewController:vc animated:YES completion:nil];
}

```

## Requirements

For UIPopoverPresentationController, you need iOS 8+.
But for UIPopoverController, you only need iOS 5+.

## Installation

YLFPopoverBackgroundView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YLFPopoverBackgroundView'
```

## Author

leavesster

## License

YLFPopoverBackgroundView is available under the MIT license. See the LICENSE file for more info.
