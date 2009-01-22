@interface WebImage : NSObject
{
	NSString 			*imageUrl;
	NSMutableData	*imageData;
}
- (id)initWithUrl:(NSString*)url;
@property(nonatomic,retain) NSString 			*imageUrl;
@property(nonatomic,retain) NSMutableData	*imageData;
@end

@implementation WebImage
- (id)initWithUrl:(NSString*)url
{
	if((self = [super init]))
	{
		self.imageUrl = url;
	}
	return self;
}
@end
