//
//  SWAccount.h
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/11.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import <Foundation/Foundation.h>

//数据模型要存入到沙盒中，必须遵守NSCoding协议
@interface SWAccount : NSObject<NSCoding>

/** string	用于调用access_token，接口获取授权后的access token。**/
@property (nonatomic, copy) NSString *access_token;
/**
 *	string	access_token的生命周期，单位是秒数。
 **/
@property (nonatomic, copy) NSString *expires_in;

/**
 *  string	access_token的生命周期（该参数即将废弃，开发者请使用expires_in）。
 **/
@property (nonatomic, copy) NSString *remind_in;

/**
 *	string	当前授权用户的UID。
 **/
@property (nonatomic, copy) NSString *uid;

/**
 *  创建时间
 **/
@property (nonatomic, strong) NSDate *create_time;

+(instancetype)accountWithDic:(NSDictionary *)dict;

@end
