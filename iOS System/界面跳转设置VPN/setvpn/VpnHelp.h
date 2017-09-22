//
//  VpnHelp.h
//  
//
//  Created by 戴曦嘉 on 2017/8/22.
//
//

#ifndef VpnHelp_h
#define VpnHelp_h



@interface PSListController : UIViewController
-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
-(void)setVPNType:(id)arg1 forSpecifier:(id)arg2;
-(void)setDisplayName:(id)arg1 forSpecifier:(id)arg2;
-(void)setServer:(id)arg1 forSpecifier:(id)arg2;
-(void)setUsername:(id)arg1 forSpecifier:(id)arg2;
-(void)setPassword:(id)arg1 forSpecifier:(id)arg2;
-(BOOL)saveConfigurationSettings;
-(void)saveButtonClicked:(id)arg1;
-(id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 ;
-(void)startEnterpriseConnection:(id)arg1 ;

@end


#endif /* VpnHelp_h */
