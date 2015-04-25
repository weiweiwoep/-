//
//  TestViewController01.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/24.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "TestViewController01.h"
#import "TestViewController02.h"

@interface TestViewController01 ()

@end

@implementation TestViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    TestViewController02 *testView02 = [[TestViewController02 alloc] init];
    testView02.title = @"测试控制器02";
    [self.navigationController pushViewController:testView02 animated:YES];
}


@end
