//
//  SetVPN.h
//  
//
//  Created by 戴曦嘉 on 2017/8/23.
//
//

#import <UIKit/UIKit.h>

@interface SetVPN : NSObject
- (void)runTask:(id)arg1 inContoller:(id)arg2;
- (void)openVPNConfiguration:(id)arg1;
- (void)addVPNConfiguration:(id)arg1 inContoller:(id)arg2;
- (void)chooseVPN:(id)arg1 inContoller:(id)arg2;
- (void)openVPNConnection:(id)arg1;
- (void)closeVPNConnection:(id)arg1;
@end
