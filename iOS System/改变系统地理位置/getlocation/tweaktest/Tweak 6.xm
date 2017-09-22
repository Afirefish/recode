#import <CoreLocation/CoreLocation.h>
#import "mmloc.h"




%hook CLLocationManager
- (void)startUpdatingLocation
{
	//create the CLLocation array
	%log;

	//%orig;
	CLLocation *l1=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l2=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l3=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l4=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	NSMutableArray *lArray=[NSMutableArray arrayWithObjects:l1,l2,l3,l4,nil];
	

	//check whether the app implement the delegate(especially handle for wechat to prevent the exit)
	if([self.delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]){
	NSLog(@"zjzzzzzztrue");
	[self.delegate locationManager:self didUpdateLocations:lArray];
	}else{
	NSLog(@"zjzzzzzzerror");
	[(MMLocationMgr *)self.delegate locationManager:self didUpdateToLocation:l4 fromLocation:[self location]];
	}

}



%end







