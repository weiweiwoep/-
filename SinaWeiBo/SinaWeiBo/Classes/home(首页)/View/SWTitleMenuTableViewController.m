//
//  SWTitleMenuTableViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/28.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWTitleMenuTableViewController.h"

@implementation SWTitleMenuTableViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"好友";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = @"密友";
    }else{
        cell.textLabel.text = @"全部";
    }
    
    return cell;
}
@end
