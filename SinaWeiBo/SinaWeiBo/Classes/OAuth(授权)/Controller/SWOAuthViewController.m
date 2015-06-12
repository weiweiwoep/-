//
//  SWOAuthViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/10.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWOAuthViewController.h"
#import "AFNetworking.h"
#import "SWAccount.h"
#import "MBProgressHUD+MJ.h"
#import "SWAccountTool.h"

@interface SWOAuthViewController()<UIWebViewDelegate>

@end

@implementation SWOAuthViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //1.创建一个webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    //2.用webView加载登录页面，（新浪提供的）
    //请求地址：https://api.weibo.com/oauth2/authorize
    //请求参数：
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2931985608&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - webView代理方法
-(void)webViewDidFinishLoad:(UIWebView *)webView{

    [MBProgressHUD hideHUD];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //1.获得url
    NSString *url = request.URL.absoluteString;
    
    //2.判断是否为回调地址
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) {  //是回调地址
        //截取[code=]后面的参数
        int fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        //利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        //禁止加载回调地址
        return NO;
    }
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [MBProgressHUD showMessage:@"正在加载..."];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [MBProgressHUD hideHUD];
}

/**
 利用code(授权成功后的request token)换取一个accessToken
 @param code 授权成功后的request token
 @returns
 @exception
 */
-(void)accessTokenWithCode:(NSString *)code{
    /**
     获取accessToken
     请求地址：https://api.weibo.com/oauth2/access_token
     请求方式：POST
     请求参数：
     client_id	    申请应用时分配的AppKey。
     client_secret	申请应用时分配的AppSecret。
     grant_type	    请求的类型，填写authorization_code
     **/

    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //mgr.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    //2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"2931985608";
    params[@"client_secret"] = @"33b130c2cc3be29d301d14c4278128db";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"code"] = code;

    //3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token"
   parameters:params
      success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
          [MBProgressHUD hideHUD];
          
          //将返回的账号数据转换为模型，存进沙盒
          SWAccount *account = [SWAccount accountWithDic:responseObject];
          
          //存储账号信息
          [SWAccountTool saveAccount:account];
          
          //以josn形式存储到文件中
          //[responseObject writeToFile:path atomically:YES];
          
          //切换根控制器
          UIWindow *window = [UIApplication sharedApplication].keyWindow;
          [window swithRootViewController];
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [MBProgressHUD hideHUD];
          SWBLog(@"请求失败！->%@",error);
      }];
}
@end
