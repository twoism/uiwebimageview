//
//  UIWebImageView.m
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright 2009 Digital Scientists. All rights reserved.
//
//  Forked by Dylan Copeland on 9/23/09.
//  Copyright 2009 DC Studios, LLC. All rights reserved.

#import "UIWebImageView.h"

@implementation UIWebImageView


#define kAnimationDuration 0.5

@synthesize animate;

#pragma mark -
#pragma mark Public Methods

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		imageData = [[NSMutableData alloc] init];
		
		activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		CGFloat xCoord = (frame.size.width / 2.0f) - [activityIndicator frame].size.width;
		CGFloat yCoord = (frame.size.height / 2.0f) - [activityIndicator frame].size.height;
		[activityIndicator setFrame:CGRectMake(xCoord, yCoord, [activityIndicator frame].size.width, [activityIndicator frame].size.height)];
		[activityIndicator setHidesWhenStopped:YES];
		
		[self addSubview:activityIndicator];
	}
	
	return self;
}

- (id)initWithFrame:(CGRect)frame andUrl:(NSURL *)url animated:(BOOL)animated {
	if (self = [self initWithFrame:frame]) {
		[activityIndicator startAnimating];
		
		animate = animated;
		
		NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
		NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

		[request release];
		[connection release];
	}
	
	return self;
}

- (void)downloadImage:(NSURL *)url {
	[activityIndicator startAnimating];
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
	
	[request release];
	[connection release];	
}

#pragma mark -
#pragma mark NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[activityIndicator stopAnimating];
	
	UIImage *downloadedImage = [[UIImage alloc] initWithData:imageData];
	
	
	if (animate) {
		
		[self setAlpha:0];
	
		[UIView beginAnimations:@"Animations" context:nil];
		[UIView setAnimationDuration:kAnimationDuration];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

		[self setAlpha:100];
		
		[UIView commitAnimations];
		
		
	}
	
		
		
		[self setImage:downloadedImage];
		
	

	
	[downloadedImage release];
}

- (void)dealloc {
	[imageData release];
	[activityIndicator release];
    [super dealloc];
}


@end
