    //
//  OGSchemeMenuView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/22.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//
#import "OGBaseViewController.h"
#import "OGSchemeMenuView.h"

#define cell_height  44.0f

@interface OGSchemeMenuView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OGSchemeMenuView{

    UITableView * _tableView;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self addSubview:_tableView];
    }
    return self;

}

- (id)initWithDelegate:(id)delegate withItems:(NSArray *)items{
    self = [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        _delegate = delegate;
        self.items= items;
    }
    
    return self;
}

- (void)setItems:(NSArray *)items{
    _items = items;
    CGRect rect = _tableView.bounds;
    rect.size.height = cell_height*items.count;
    _tableView.frame = rect;
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textColor = [UIColor grayColor];
    }
    cell.textLabel.text = _items[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectedMenuView:withIndexPath:)]) {
        [self.delegate selectedMenuView:self withIndexPath:indexPath];
    }
}

static CGFloat height = 0;

- (void)showInView:(UIView *)view{
    [view addSubview:self];
    CGRect rect = _tableView.frame;
    _tableView.frame = CGRectMake(0, 0, rect.size.width, height);
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = rect;
    } completion:^(BOOL finished) {
        height = rect.size.height;
    }];
    
    rect =  self.frame;
    rect.origin = _origin;
    self.frame =rect;


}

- (void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        height = 0.0f;
    }];
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}


@end
