//
//  HomeViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/23.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "SWDropdownMenu.h"
#import "SWTitleMenuTableViewController.h"

@interface HomeViewController ()<SWDropdownMenuDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加leftBarButtonItem按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendsearch) image:@"navigationbar_friendsearch" hightImage:@"navigationbar_friendsearch_highlighted"];
    
    //添加rightBarButtonItem按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" hightImage:@"navigationbar_pop_highlighted"];
    
    //修改navigation的TitleView
    UIButton *titleButton = [[UIButton alloc] init];
    titleButton.width = 150;
    titleButton.height = 30;
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Target Action

-(void)friendsearch{
    SWBLog(@"%s",__FUNCTION__);
}

-(void)pop{
    
    SWBLog(@"%s",__FUNCTION__);
}

-(void)titleClick:(UIButton *) titleButton{
    
    //1.创建下拉菜单
    SWDropdownMenu *menu = [SWDropdownMenu menu];
    menu.delegate = self;
    //2.设置内容
//    meun.content = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    meun.content = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];

    SWTitleMenuTableViewController *vc = [[SWTitleMenuTableViewController alloc] init];
    vc.view.height = 44*3;
    vc.view.width = 100;
    menu.contentController = vc;
    
    //3.显示
    [menu showFrom:titleButton];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

#pragma mark - SWDropdownMenuDelegate代理方法

/**
 * 下拉菜单被销毁
 **/
-(void)dropdownMenuDidDismiss:(SWDropdownMenu *)menu{
    //4.让剪头向下
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    //方式1
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //方式2
    titleButton.selected =  NO;
}

/**
 * 下拉菜单显示
 **/
-(void)dropdownMenuDidShow:(SWDropdownMenu *)menu{
    //4.让剪头向上
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    //方式1
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    //方式2
    titleButton.selected =  YES;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
