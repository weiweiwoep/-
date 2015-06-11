//
//  SWAccount.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/11.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWAccount.h"

@implementation SWAccount

+(instancetype)accountWithDic:(NSDictionary *)dict{

    SWAccount *account = [[self alloc] init];
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.remind_in = dict[@"remind_in"];
    account.uid = dict[@"uid"];
    
    return account;
}

/**
 当一个对象要归档进沙盒中时，就会调用这个方法
 目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
-(void) encodeWithCoder:(NSCoder *)encode{
    [encode encodeObject:self.access_token forKey:@"access_token"];
    [encode encodeObject:self.expires_in forKey:@"expires_in"];
    [encode encodeObject:self.uid forKey:@"uid"];
}

/**
 * 当从沙盒中解档一个对象时(从沙盒中加载一个对象时)，就会调用这个方法
 * 目的：这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 **/
-(id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.access_token = [decoder decodeObjectForKey:@"expires_in"];
        self.access_token = [decoder decodeObjectForKey:@"uid"];
    }
    return self;
}

@end
