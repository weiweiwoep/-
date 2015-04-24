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
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    TestViewController02 *testView02 = [[TestViewController02 alloc] init];
    testView02.title = @"测试控制器02";
    [self.navigationController pushViewController:testView02 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
