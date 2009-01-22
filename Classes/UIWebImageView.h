//
//  UIWebImageView.h
//  WebImage
//
//  Created by Christopher Burnett on 1/22/09.
//  Copyright 2009 Digital Scientists. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIWebImageView : UIImageView {
	NSString 			*imageUrl;
	NSMutableData	*imageData;
	UIImage				*loadedImage;
	UIActivityIndicatorView *loader;
}

@property(nonatomic,retain) NSString 			*imageUrl;
@property(nonatomic,retain) NSMutableData	*imageData;
@property(nonatomic,retain) UIImage				*loadedImage;
@property(nonatomic,retain) UIActivityIndicatorView *loader;
- (id)initWithFrame:(CGRect)frame andUrl:(NSString*)url;	
- (void)initRequest;

@end
