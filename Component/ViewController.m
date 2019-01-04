//
//  ViewController.m
//  Component
//
//  Created by 张熔冰 on 2018/12/18.
//  Copyright © 2018年 Lovcreate. All rights reserved.
//

#import "ViewController.h"
#import "DialogController.h"
#import "SheetController.h"
#import "SharedViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *sourceData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"组件库";
    [self initTalbeView];
    [self initSourceData];
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sourceData count];
}

static NSString *CellIdentifier = @"CellIdentifier";
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *title = [self.sourceData objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.text = title;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = [self.sourceData objectAtIndex:indexPath.row];
    if([title isEqualToString:@"提示框(AlertController)"]){
        [self showAlertController];
    }else if([title isEqualToString:@"分享菜单(SharedViewController)"]){
        [self showSharedController];
    }else if([title isEqualToString:@"选择图片(SelectedPictureController)"]){
        [self showSelectPictureController];
    }
}

#pragma mark - Public
-(void)initTalbeView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}
-(void)initSourceData{
    self.sourceData = @[@"提示框(AlertController)", @"分享菜单(SharedViewController)", @"选择图片(SelectedPictureController)"];
}

//提示框
-(void)showAlertController{
    DialogController *dialog = [DialogController dialogControllerWithTitle:@"标题" message:@"我就是内容了我就是内容了我就是内容了我就是内容了我就是内容了我就是内容了"];
    
    DialogAction *cancelAction = [DialogAction actionWithTitle:@"action1" handler:^(DialogAction * _Nonnull action) {
        LC_DebugLog(@"action1");
    }];
    DialogAction *operationAction = [DialogAction actionWithTitle:@"action2" handler:^(DialogAction * _Nonnull action) {
        LC_DebugLog(@"action2");
    }];
    [dialog addAction:cancelAction];
    [dialog addAction:operationAction];
    [dialog addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"账号";
    }];
    [dialog addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
    }];
    [self presentViewController:dialog animated:YES completion:^(){
        LC_DebugLog(@"Dialog 展示完成");
    }];
}
//分享菜单
-(void)showSharedController{
    SharedAction *WXFriend = [SharedAction actionWithTitle:@"微信好友" image:[UIImage imageNamed:@"shared_微信好友"] handler:^(SharedAction *action) {
        LC_DebugLog(@"微信好友");
    }];
    SharedAction *Weibo = [SharedAction actionWithTitle:@"微博" image:[UIImage imageNamed:@"shared_微博"] handler:^(SharedAction *action) {
        LC_DebugLog(@"微博");
    }];
    SharedAction *WXCircle = [SharedAction actionWithTitle:@"朋友圈" image:[UIImage imageNamed:@"shared_朋友圈"] handler:^(SharedAction *action) {
        LC_DebugLog(@"朋友圈");
    }];
    SharedViewController *controller = [SharedViewController controller];
    [controller addAction:WXFriend];
    [controller addAction:Weibo];
    [controller addAction:WXCircle];
    
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)showSelectPictureController{
    SheetAction *takePhotosAction = [SheetAction actionWithTitle:@"拍照" image:nil handler:^(SheetAction *action) {
        LC_DebugLog(@"拍照");
    }];
    SheetAction *albumAction = [SheetAction actionWithTitle:@"从手机相册选择" image:nil handler:^(SheetAction *action) {
        LC_DebugLog(@"从相册选择");
    }];
    SheetController *controller = [SheetController controllerWithCancelTitle:@"取消"];
    [controller addAction:takePhotosAction];
    [controller addAction:albumAction];
    [self presentViewController:controller animated:YES completion:nil];
}
@end
