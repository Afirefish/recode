//
//  Header.h
//  
//
//  Created by 戴曦嘉 on 2017/9/26.
//
//

#ifndef Header_h
#define Header_h

@interface VPNConnectionStore
+(id)sharedInstance;
-(unsigned long long)currentOnlyConnectionGrade;
-(id)currentConnectionWithGrade:(unsigned long long)arg1 ;

@end

@interface VPNConnection
@property (readonly) unsigned long long status;
@end
#endif /* Header_h */
