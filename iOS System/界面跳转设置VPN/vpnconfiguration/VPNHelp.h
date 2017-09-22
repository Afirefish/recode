//
//  VPNHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/8/23.
//
//

#ifndef VPNHelp_h
#define VPNHelp_h

@interface PSListController : UIViewController
@end

@interface VPNController : PSListController
-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 ;
-(id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 ;
-(void)startEnterpriseConnection:(id)arg1 ;
-(void)cancelEnterpriseConnection:(id)arg1 ;

@end

@interface VPNSetupListController : PSListController
-(void)setVPNType:(id)arg1 forSpecifier:(id)arg2;
-(void)setDisplayName:(id)arg1 forSpecifier:(id)arg2;
-(void)setServer:(id)arg1 forSpecifier:(id)arg2;
-(void)setUsername:(id)arg1 forSpecifier:(id)arg2;
-(void)setPassword:(id)arg1 forSpecifier:(id)arg2;
-(void)saveButtonClicked:(id)arg1;

@end

#endif /* VPNHelp_h */
