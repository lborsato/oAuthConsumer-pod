#
# Be sure to run `pod lib lint OAuthConsumer.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OAuthConsumer"
  s.version          = "0.1.0"
  s.summary          = "OAuthConsumer is an iPhone-ready iOS 8.0 compatible, ARC-supported OAuth implementation."
  s.description      = <<-DESC
#OAuthConsumer


This is an iPhone ready version of:
http://oauth.googlecode.com/svn/code/obj-c/OAuthConsumer by Jon Crosby.

This version has been updated for iOS 8.0 and to use Automatic Reference Counting (ARC). You will need to add **Security.framework**.

"iPhone ready" simply means you just need to add the files to Xcode, and import "OAuthConsumer.h".

OADataFetcher now also includes the ability to use blocks in addition to delegates as seen in this example:

	OAConsumer *consumer = [[OAConsumer alloc] initWithKey:self.consumerKey secret:self.consumerSecret];
	OAToken *token = [[OAToken alloc] initWithKey:self.accessToken secret:self.accessTokenSecret];
	NSURL* url = [NSURL URLWithString:urlString];
	OAMutableURLRequest* request = [[OAMutableURLRequest alloc] initWithURL:url consumer:consumer token:token realm:nil signatureProvider:nil];
	[request setHTTPMethod:@"POST"];
	NSMutableArray *params = [[NSMutableArray alloc] init];
	for ( NSString *key in [postParams allKeys] )
	{
		OARequestParameter* param = [[OARequestParameter alloc] initWithName:key value:postParams[key]];
		[params addObject:param];
	}
	if ( [params count] > 0 )
		[request setParameters:params];
	OADataFetcher* dataFetcher = [[OADataFetcher alloc] init];
	[dataFetcher performRequest:request
					withHandler:^(OAServiceTicket *ticket, NSData *data, NSError *error) {
				   if ( !error ) {
					   NSLog(@"didPost:=%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
					   [self updateStatusCompleteWithStatus:SCUpdateSuccessful data:data error:nil];
				   }
				   else
				   {
					   [self updateStatusCompleteWithStatus:SCUpdateFailed data:data error:error];
				   }
			   }];


This is a work in progress. Please feel free to contact me at larry [at] larryborsato [dot] com.
                       DESC
  s.homepage         = "https://github.com/lborsato/oAuthConsumer-pod"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Larry Borsato" => "larry@larryborsato.com" }
  s.source           = { :git => "https://github.com/lborsato/oAuthConsumer-pod.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lborsato'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{m.h}'
  s.resource_bundles = {
    'OAuthConsumer' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
