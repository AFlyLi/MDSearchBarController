//
//  MainViewController.m
//  SearchBarProject
//
//  Created by Alexander on 12.11.13.
//  Copyright (c) 2013 ООО "МД технолоджис". All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.searchBarController.searchBarView.frame = self.searchBar.frame;
    [self.searchBar.superview addSubview:self.searchBarController.searchBarView];
    [self.searchBar removeFromSuperview];
    self.searchBarController.delegate= self;
    
    self.searchBar = self.searchBarController.searchBarView;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

-(void)searchBar:(MDSearchBarController *)searchBarController searchWithText:(NSString *)text{
    self.count = text.length;
    [self.searchBarController reloadData];
}
@end
