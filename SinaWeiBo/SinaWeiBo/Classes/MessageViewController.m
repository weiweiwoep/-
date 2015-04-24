//
//  MessageViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/23.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "MessageViewController.h"
#import "TestViewController01.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test-message-%ld",(long)indexPath.row];
    return cell;
}

#pragma mark 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TestViewController01 *testView =[[TestViewController01 alloc] init];
    testView.title = @"测试控制器";
    //当testView控制器被push的时候，testView所在的tabbarController的tabbar会自动隐藏
    //当testView控制器被pop时，testView所在的tabbarController的tabbar会自动显示出来
    testView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testView animated:YES];
}

@end
