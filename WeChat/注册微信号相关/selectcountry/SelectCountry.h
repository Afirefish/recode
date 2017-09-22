//
//  SelectCountry.h
//  
//
//  Created by 戴曦嘉 on 2017/8/25.
//
//

#import <Foundation/Foundation.h>

@interface SelectCountry : NSObject
+ (instancetype)singleInstance;
- (void)selectCountry:(id)arg1 inContoller:(id)arg2;//判断国家是否是arg1传国家编码，不是则跳到国家编码的数据源控制器，arg2传要输入国家编码的控制器
- (void)searchCountry:(id)arg1 inContoller:(id)arg2;//选择国家 arg1传国家编码 arg2国家编码的数据源控制器
@end
