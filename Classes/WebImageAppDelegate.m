//
//  WebImageAppDelegate.m
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright Digital Scientists 2009. All rights reserved.
//

#import "WebImageAppDelegate.h"
#import "WebImageViewController.h"

@implementation WebImageAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
