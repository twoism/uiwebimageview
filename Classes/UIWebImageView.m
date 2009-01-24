//
//  UIWebImageView.m
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright 2009 Digital Scientists. All rights reserved.
//

#import "UIWebImageView.h"


@implementation UIWebImageView

@synthesize imageUrl;
@synthesize imageData;
@synthesize loadedImage;
@synthesize loader;
@synthesize frameRect;

- (id)initWithFrame:(CGRect)frame andUrl:(NSString*)url 
{
	if (self = [super initWithFrame:frame]) {
		self.imageUrl							= url;
		self.contentMode					= UIViewContentModeScaleAspectFit;
		self.backgroundColor      = [UIColor blackColor];
		self.frameRect						= frame;
		[self initRequest];
	}
	return self;
}
- (void)dealloc {
	[imageUrl release];
	[loadedImage release];
	[imageData release];
	[loader release];
	[super dealloc];
}

- (void)initRequest
{
	[self drawLoader:self.frameRect];
	NSURL *requestUrl 		= [NSURL URLWithString:self.imageUrl];
	NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl 
																					 cachePolicy:(NSURLRequestCachePolicy)NSURLRequestReloadIgnoringLocalCacheData 
																			 timeoutInterval:(NSTimeInterval)10];
	self.imageData    		= [[NSMutableData data] retain];
	[NSURLConnection connectionWithRequest:request 
																delegate:self ];
}

-(void)drawLoader:(CGRect)frame
{
	
	self.loader = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((frame.size.width/2)-10,(frame.size.height/2)-10,20,20)];
	self.loader.hidesWhenStopped = YES;
	[self.loader startAnimating];
	[self addSubview:self.loader];
	
	//if (self.loader.isHidden == YES) {
	//}else{
	//NSLog(@"is not null");
	//self.loader = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((frame.size.width/2)-10,(frame.size.height/2)-10,20,20)];
	//[self.loader startAnimating];
	//}
}


- (void)drawRect:(CGRect)rect {
	// Drawing code
}

// NSURLConnection Delegate Methods //
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
	NSLog(@"Recieving Data...");
	[[self imageData] appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Fininshed Loading...");
	self.loadedImage = [[UIImage alloc] initWithData:self.imageData];
	
	
	
	//[self setAlpha:0];
	[UIView beginAnimations:nil	context:NULL];
	[UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
	
	[UIView setAnimationDuration:1.0];
	//[self setAlpha:1.0];
	[UIView commitAnimations];
	
	self.image			 = self.loadedImage;
	[self.loader stopAnimating];
	NSLog(@"image : %@",self.loadedImage);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription]
																									message:[error localizedFailureReason]
																								 delegate:self 
																				cancelButtonTitle:@"OK"
																				otherButtonTitles: nil];
	
	[alert show];
	[alert release];
}
// ----------------------------- //

@end
