#import <CoreLocation/CoreLocation.h>
#import "mmloc.h"
%hook NSTimeZone
+ (id)systemTimeZone
{	
	%log;
	id x=%orig;
	NSLog(@"systemTimeZone--------%@",[x class]);
	
	return x;
}
+ (id)timeZoneWithName:(id)arg1
{
	%log;
	/*NSMutableDictionary *abbs = [[NSMutableDictionary alloc] init];
	[abbs setValuesForKeysWithDictionary:[NSTimeZone abbreviationDictionary]];
	[abbs setValue:@"Asia/Shanghai" forKey:@"CCD"];
	arg1= abbs;
	NSLog(@"setAbbreviationDictionary------%@",arg1);*/
	NSString *string=@"Asia/Shanghai";
	arg1=string;
	id x=%orig;
	return x;
}
%end




%hook CLLocationManager
- (void)startUpdatingLocation
{
	%log;
	//[self.location initWithLatitude: 31.000 longitude: 121.000];

	//%orig;
	CLLocation *l1=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l2=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l3=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	CLLocation *l4=[[CLLocation alloc] initWithLatitude:31.000 longitude:121.000];
	NSMutableArray *lArray=[NSMutableArray arrayWithObjects:l1,l2,l3,l4,nil];

	if([self.delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]){
	NSLog(@"zjzzzzzztrue");
	[self.delegate locationManager:self didUpdateLocations:lArray];
	}else{
	NSLog(@"zjzzzzzzerror");
	[(MMLocationMgr *)self.delegate locationManager:self didUpdateToLocation:l4 fromLocation:[self location]];
	}
}





%end

%hook CLIndoorPositionProvider
- (void)startUpdatingLocation
{
	NSLog(@"gpsstartUpdatingLocation-----");
	%orig;
}
%end




%hook MMLocationMgr



- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 
	{ %log; %orig; }

- (void)addToUnusedLocationMgr:(id)arg1 { %log; %orig; }

- (id)cityFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" cityFromAddressDic = %@", r); return r; }

- (void)cleanUpUnusedLocationMgr 
{ %log; %orig; }

- (void)connection:(id)arg1 didReceiveData:(id)arg2 { %log; %orig; }

- (void)connection:(id)arg1 didReceiveResponse:(id)arg2 { %log; %orig; }

- (void)connectionDidFinishLoading:(id)arg1 { %log; %orig; }

- (id)countryCodeFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" countryCodeFromAddressDic = %@", r); return r; }

- (id)countryFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" countryFromAddressDic = %@", r); return r; }

- (void)dealloc { %log; %orig; }

- (id)evolvedCityFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" evolvedCityFromAddressDic = %@", r); return r; }

- (id)findDictionaryByGeo:(id)arg1 { %log; id r = %orig; HBLogDebug(@" findDictionaryByGeo = %@", r); return r; }

- (id)findDictionaryByKey:(id)arg1 { %log; id r = %orig; HBLogDebug(@"findDictionaryByKey = %@", r); return r; }

- (id)getAESKeyWithRSAEncrypted { %log; id r = %orig; HBLogDebug(@" getAESKeyWithRSAEncrypted = %@", r); return r; }

- (id)getAddressByLocation:(id)arg1 { %log; id r = %orig; HBLogDebug(@" getAddressByLocation = %@", r); return r; }

- (id)getEncryptReportWithLocation:(_Bool)arg1 WithSSID:(_Bool)arg2 { %log; id r = %orig; HBLogDebug(@"getEncryptReportWithLocation = %@", r); return r; }

- (id)getExtraInfoFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" getExtraInfoFromAddressDic = %@", r); return r; }

- (id)getLastLocationCache { %log; id r = %orig; HBLogDebug(@" getLastLocationCache = %@", r); return r; }

- (id)getLocationCacheStorage { %log; id r = %orig; HBLogDebug(@" getLocationCacheStorage = %@", r); return r; }

- (id)getRealtimeLocationCache { %log; id r = %orig; HBLogDebug(@"getRealtimeLocationCache = %@", r); return r; }

- (id)getReportWithLocation:(_Bool)arg1 WithSSID:(_Bool)arg2 { %log; id r = %orig; HBLogDebug(@" getReportWithLocation = %@", r); return r; }

- (id)init { %log; id r = %orig; HBLogDebug(@"init = %@", r); return r; }

- (_Bool)isAccurateLocation:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@"isAccurateLocation = %d", r); return r; }

- (_Bool)isCoordinateInChina:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@"isCoordinateInChina = %d", r); return r; }

- (_Bool)isUpdatingGPSLocation:(unsigned long long)arg1 { %log; _Bool r = %orig; HBLogDebug(@" isUpdatingGPSLocation = %d", r); return r; }

- (_Bool)isUpdatingHeading:(unsigned long long)arg1 { %log; _Bool r = %orig; HBLogDebug(@" isUpdatingHeading = %d", r); return r; }

- (_Bool)isUpdatingMapLocation:(long long)arg1 { %log; _Bool r = %orig; HBLogDebug(@"isUpdatingMapLocation = %d", r); return r; }

- (id)keyForLocation:(id)arg1 { %log; id r = %orig; HBLogDebug(@" keyForLocation = %@", r); return r; }

- (void)setLoactionMgrList:(NSMutableArray *)loactionMgrList { %log; %orig; }

- (NSMutableArray *)loactionMgrList { %log; NSMutableArray * r = %orig; HBLogDebug(@" loactionMgrList = %@", r); return r; }

- (void)loadLocationCacheStorage { %log; %orig; }

- (double)locationAccuracy:(id)arg1 { %log; double r = %orig; HBLogDebug(@" locationAccuracy = %f", r); return r; }


- (void)locationManager:(id)arg1 didFailWithError:(id)arg2 { %log; %orig; }

- (void)locationManager:(id)arg1 didUpdateHeading:(id)arg2 { %log; %orig; }

- (void)locationManager:(id)arg1 didUpdateToLocation:(id)arg2 fromLocation:(id)arg3 { 		%log; 
	%orig; }









- (void)mapView:(id)arg1 didFailToLocateUserWithError:(id)arg2 { %log; %orig; }

- (void)mapView:(id)arg1 didUpdateUserLocation:(id)arg2 { %log; %orig; }

- (void)mapViewDidFailLoadingMap:(id)arg1 withError:(id)arg2 { %log; %orig; }

- (void)onServiceClearData { %log; %orig; }

- (void)onServiceInit { %log; %orig; }

- (void)onServiceReloadData { %log; %orig; }

- (void)onUpdateLocationFromLocationManager:(id)arg1 { %log; %orig; }

- (id)provinceFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" provinceFromAddressDic = %@", r); return r; }

- (void)requestForAuthorization { %log; %orig; }

- (void)requestReverseGeoWithParam:(id)arg1 { %log; %orig; }

- (void)requestWXGeocodeWithParam:(id)arg1 { %log; %orig; }

- (id)roughAddressFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" roughAddressFromAddressDic = %@", r); return r; }

- (id)routeFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" routeFromAddressDic = %@", r); return r; }

- (void)saveLocationCacheStorage { %log; %orig; }

- (void)setUnusedLocationMgr:(NSMutableArray *)unusedLocationMgr { %log; %orig; }

- (NSMutableArray *)unusedLocationMgr { %log; NSMutableArray * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (id)shortAddressFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" shortAddressFromAddressDic = %@", r); return r; }

- (unsigned long long)startUpdateGPSLocation { %log; unsigned long long r = %orig; HBLogDebug(@" startUpdateGPSLocation = %llu", r); return r; }

- (unsigned long long)startUpdateHeading { %log; unsigned long long r = %orig; HBLogDebug(@" startUpdateHeading = %llu", r); return r; }

- (long long)startUpdateMapLocation { %log; long long r = %orig; HBLogDebug(@"startUpdateMapLocation = %lld", r); return r; }

- (void)stopGeoAddress:(id)arg1 { %log; %orig; }

- (void)stopUpdateAddressByTag:(unsigned long long)arg1 { %log; %orig; }

- (void)stopUpdateGPSLocation:(unsigned long long)arg1 { %log; %orig; }

- (void)stopUpdateHeading:(unsigned long long)arg1 { %log; %orig; }

- (void)stopUpdateMapLocation:(long long)arg1 { %log; %orig; }

- (id)subLocalityFromAddressDic:(id)arg1 { %log; id r = %orig; HBLogDebug(@" subLocalityFromAddressDic= %@", r); return r; }

- (unsigned long long)updateAddressByLocation:(id)arg1 { %log; unsigned long long r = %orig; HBLogDebug(@" updateAddressByLocation = %llu", r); return r; }

- (void)updateLocationCache:(id)arg1 isMarsLocation:(_Bool)arg2 { %log; %orig; }

- (void)updateWifiInfo { %log; %orig; }

- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@"debugDescription = %@", r); return r; }

- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" description = %@", r); return r; }

- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" hash = %llu", r); return r; }

- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" superclass = %@", r); return r; }

%end
