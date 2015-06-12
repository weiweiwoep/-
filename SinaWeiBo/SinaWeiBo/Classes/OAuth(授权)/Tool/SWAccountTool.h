//
//  SWAccountTool.h
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/12.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//处理账号相关的所有操作，存储账号，取出账号，验证账号

#import <Foundation/Foundation.h>
@class SWAccount;

@interface SWAccountTool : NSObject

/**
 存储账号信息
 @param 账号模型对象
 @returns
 @exception
 */
+(void)saveAccount:(SWAccount *)account;

/**
 返回账号信息
 @param
 @returns 账号信息
 @exception
 */
+(SWAccount *)account;

@end
