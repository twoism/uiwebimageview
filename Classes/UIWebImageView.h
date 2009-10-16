//
//  UIWebImageView.h
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright 2009 Digital Scientists. All rights reserved.
//
//  Forked by Dylan Copeland on 9/23/09.
//  Copyright 2009 DC Studios, LLC. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIWebImageView : UIImageView {
	NSMutableData *imageData;
	UIActivityIndicatorView *activityIndicator;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andUrl:(NSURL *)url;
- (void)downloadImage:(NSURL *)url;

@end

