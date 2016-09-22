//
//  ViewController.m
//  GDRefreshControl
//
//  Created by X-Designer on 16/9/19.
//  Copyright © 2016年 Guoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, retain) NSMutableArray *dataArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    
    [self.view addSubview:self.tableView];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.tintColor = [UIColor redColor];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"表拉了"];
    [refresh addTarget:self action:@selector(refreshTableView:) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = refresh;
    
    
}
- (void)refreshTableView:(UIRefreshControl *)refresh {

    if (refresh.refreshing) {
        refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在刷新..."];
    }

}
#pragma mark - 代理方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    }
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
    tempLabel.textAlignment = NSTextAlignmentLeft;
    tempLabel.text = [_dataArray objectAtIndex:indexPath.row];
    [cell addSubview:tempLabel];
    
    return cell;
    
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        tableView1.delegate = self;
        tableView1.dataSource = self;
        _tableView = tableView1;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
