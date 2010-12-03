//
//  WebImageViewController.m
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright Digital Scientists 2009. All rights reserved.
//

#import "WebImageViewController.h"
#import "UIWebImageView.h"
@implementation WebImageViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	/*
	http://farm3.static.flickr.com/2021/2513548523_56aa524ca4_b.jpg 
	http://farm1.static.flickr.com/87/265108031_3c66535005.jpg
	http://farm2.static.flickr.com/1279/556835763_704e41645e_o.jpg
	http://farm2.static.flickr.com/1204/789803401_0017756904.jpg
	*/
	NSString *url = [[NSString alloc] initWithString:@"http://trouble.philadelphiaweekly.com/archives/lemur%20tongue.jpg"];
	
	UIWebImageView *webImage = [[UIWebImageView alloc] initWithFrame:CGRectMake(0,0,320,480) 
															  andUrl:[NSURL URLWithString:url] 
															animated:YES];	
	
	[[self view] addSubview:webImage];
	
	//webImage.imageUrl = @"http://farm2.static.flickr.com/1279/556835763_704e41645e_o.jpg";
	//[webImage initRequest];
	
	[super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
