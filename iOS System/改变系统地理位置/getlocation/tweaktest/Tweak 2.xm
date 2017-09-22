#import "loc.h"

%hook CLPlacemark
+ (id)placemarkWithGEOMapItem:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (BOOL)supportsSecureCoding { %log; BOOL r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)ISOcountryCode { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)_geoMapItem { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)_initWithGeoMapItem:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)addressDictionary { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)administrativeArea { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)areasOfInterest { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)country { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)dealloc { %log; %orig; }
- (id)description { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (id)formattedAddressLines { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)fullThoroughfare { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithCoder:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithLocation:(id)arg1 addressDictionary:(id)arg2 region:(id)arg3 areasOfInterest:(id)arg4 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)initWithPlacemark:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)inlandWater { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)locality { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)location { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)name { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)ocean { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)postalCode { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)region { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)subAdministrativeArea { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)subLocality { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)subThoroughfare { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)thoroughfare { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)timeZone { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
