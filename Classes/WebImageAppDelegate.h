//
//  WebImageAppDelegate.h
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright Digital Scientists 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebImageViewController;

@interface WebImageAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebImageViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebImageViewController *viewController;

@end

