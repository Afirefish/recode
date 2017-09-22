#import "loc.h"

%hook CLLocation
+ (BOOL)supportsSecureCoding 
{ %log; BOOL r = %orig; HBLogDebug(@"supportsSecureCoding = %d", r); return r; }

- (double)altitude 
{ %log; double r = %orig; HBLogDebug(@"altitude = %f", r); return r; }

- (double)course 
{ %log; double r = %orig; HBLogDebug(@" course = %f", r); return r; }

- (void)dealloc { %log; %orig; }

- (id)description 
{
	 %log; 

	id r = %orig; 
	
	HBLogDebug(@"description = %@---------",r); 
	return r;
 }

- (double)distanceFromLocation:(id)arg1 
{ %log; double r = %orig; HBLogDebug(@" distanceFromLocation = %f", r); return r; }

- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (id)floor 
{ %log; id r = %orig; HBLogDebug(@"floor = %@", r); return r; }

- (double)getDistanceFrom:(id)arg1 
{ %log; double r = %orig; HBLogDebug(@"getDistanceFrom = %f", r); return r; }

- (double)horizontalAccuracy 
{ %log; double r = %orig; HBLogDebug(@"horizontalAccuracy = %f", r); return r; }

- (id)init 
{ %log; id r = %orig; HBLogDebug(@" init = %@", r); return r; }

- (id)initWithCoder:(id)arg1 
{ %log; id r = %orig; HBLogDebug(@"initWithCoder = %@", r); return r; }


- (unsigned int)integrity 
{ %log; unsigned int r = %orig; HBLogDebug(@"integrity = %u", r); return r; }

- (id)iso6709Notation 
{ %log; id r = %orig; HBLogDebug(@"iso6709Notation = %@", r); return r; }

- (id)matchInfo
 { %log; id r = %orig; HBLogDebug(@" matchInfo = %@", r); return r; }

- (id)propagateLocationToTime:(double)arg1 
{ %log; id r = %orig; HBLogDebug(@"propagateLocationToTime = %@", r); return r; }

- (double)rawCourse 
{ %log; double r = %orig; HBLogDebug(@"rawCourse = %f", r); return r; }

- (int)referenceFrame 
{ %log; int r = %orig; HBLogDebug(@"referenceFrame = %d", r); return r; }

- (void)setHorizontalAccuracy:(double)arg1 { %log; %orig; }

- (void)setReferenceFrame:(int)arg1 { %log; %orig; }

- (id)shortDescription 
{ %log; id r = %orig; HBLogDebug(@"shortDescription = %@", r); return r; }

- (id)snapToResolution:(double)arg1 
{ %log; id r = %orig; HBLogDebug(@"snapToResolution = %@", r); return r; }

- (double)speed 
{ %log; double r = %orig; HBLogDebug(@"speed = %f", r); return r; }

- (id)timestamp 
{ 
	%log;
	id r = %orig; 
	[self initWithLatitude: 49.12312 longitude: 132.1241];
	NSLog(@"timestamp------------%lf------%lf",[self coordinate].x1,[self coordinate].x2);
	HBLogDebug(@"timestamp = %@", r); 
	return r;
}

- (int)type 
{ %log; int r = %orig; HBLogDebug(@"type = %d", r); return r; }

- (double)verticalAccuracy 
{ %log; double r = %orig; HBLogDebug(@"verticalAccuracy = %f", r); return r; }

+ (id)_mapkit_stringWithType:(int)arg1
 { %log; id r = %orig; HBLogDebug(@"_mapkit_stringWithType = %@", r); return r; }

+ (double)_mapkit_timeToExpire 
{ %log; double r = %orig; HBLogDebug(@"_mapkit_timeToExpire = %f", r); return r; }

- (double)_mapkit_courseAccuracy 
{ %log; double r = %orig; HBLogDebug(@" _mapkit_courseAccuracy = %f", r); return r; }

- (BOOL)_mapkit_hasMatch 
{ %log; BOOL r = %orig; HBLogDebug(@"_mapkit_hasMatch = %d", r); return r; }

- (BOOL)_mapkit_hasValidCourse 
{ %log; BOOL r = %orig; HBLogDebug(@"_mapkit_hasValidCourse = %d", r); return r; }

- (BOOL)_mapkit_isStale 
{ %log; BOOL r = %orig; HBLogDebug(@"_mapkit_isStale = %d", r); return r; }

- (BOOL)_mapkit_legacyHasMatch 
{ %log; BOOL r = %orig; HBLogDebug(@"_mapkit_legacyHasMatch = %d", r); return r; }

- (id)_mapkit_locationDescription { %log; id r = %orig; HBLogDebug(@"_mapkit_locationDescription = %@", r); return r; }

- (id)_mapkit_routeMatch 
{ %log; id r = %orig; HBLogDebug(@"_mapkit_routeMatch = %@", r); return r; }

- (int)_mapkit_source 
{ %log; int r = %orig; HBLogDebug(@"_mapkit_source = %d", r); return r; }

- (double)_mapkit_speedAccuracy 
{ %log; double r = %orig; HBLogDebug(@"_mapkit_speedAccuracy = %f", r); return r; }

- (id)cam_videoMetadataRepresentation 
{ %log; id r = %orig; HBLogDebug(@" cam_videoMetadataRepresentation = %@", r); return r; }

- (unsigned int)cplSpecialHash 
{ %log; unsigned int r = %orig; HBLogDebug(@"cplSpecialHash = %u", r); return r; }

- (BOOL)cplSpecialIsEqual:(id)arg1
 { %log; BOOL r = %orig; HBLogDebug(@"cplSpecialIsEqual = %d", r); return r; }

- (id)initWithCPLArchiver:(id)arg1
 { %log; id r = %orig; HBLogDebug(@"initWithCPLArchiver = %@", r); return r; }

- (id)plistArchiveWithCPLArchiver:(id)arg1 
{ %log; id r = %orig; HBLogDebug(@"plistArchiveWithCPLArchiver = %@", r); return r; }

- (int)pl_locationHash 
{ %log; int r = %orig; HBLogDebug(@"pl_locationHash = %d", r); return r; }

- (id)pl_newSurroundingLocationsHashes 
{ %log; id r = %orig; HBLogDebug(@"pl_newSurroundingLocationsHashes = %@", r); return r; }


%end


%hook CLLocation
- (id)initWithLatitude:(double)arg1 longitude:(double)arg2
{
	%log;
	arg1=49.12312;
	arg2=132.1241;
	id x=%orig;
	NSLog(@"_mapkit_courseAccuracy? %@",x);
	NSLog(@"outPut_mapkit_courseAccuracy ---------%lf------%lf", self.coordinate.x2,self.coordinate.x1 );
	return x;
}
%end


%hook CLLocationManager
- (void)onClientEventLocation:(id)arg1
{
	%log;
	NSLog(@"onClientEventLocation----%@",arg1);
	[(CLLocation *)arg1 initWithLatitude: 49.12312 longitude: 132.1241];
	NSLog(@"onClientEventLocation2----%@----%lf---%lf",[self location],[[self location] coordinate].x1, [[self location] coordinate].x2);
	 
	%orig;
}


- (void)startUpdatingLocation
{
	%log;
	NSLog(@"startUpdatingLocation---------%@",[self location]);
	

	%orig;
	[self.location initWithLatitude: 49.12312 longitude: 132.1241];
}

- (void)stopUpdatingLocation
{
	%log;
	NSLog(@"stopUpdatingLocation!");
	%orig;
}
%end
