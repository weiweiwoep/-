//
//  SWAccountTool.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/12.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWAccountTool.h"
#import "SWAccount.h"

#define SWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation SWAccountTool

/**
 存储账号信息
 @param 账号模型对象
 @returns
 @exception
 */
+(void)saveAccount:(SWAccount *)account{
    // 获得账号存储的时间（accessToken的产生时间）
    account.create_time = [NSDate date];
    //自定义对象的存储必须用NSKeyArchiver,不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:SWAccountPath];
}

/**
 返回账号信息
 @param
 @returns 账号信息
 @exception
 */
+(SWAccount *)account{
    //加载模型
       SWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:SWAccountPath];
    
    /* 验证账号是否过期 */
    //过期秒数
    long long expires_in = [account.expires_in longLongValue];
    //获取过期时间
    NSDate *expiresTime = [account.create_time dateByAddingTimeInterval:expires_in];
    //获取当前时间
    NSDate *now = [NSDate date];
    
    NSComparisonResult result = [expiresTime compare:now];
    if(result != NSOrderedDescending){   //过期
        return nil;
    }
    SWBLog(@"%@  %@",expiresTime,now);
    return account;
}

@end
