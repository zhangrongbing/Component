# Component
组件库
## SharedViewController 分享菜单使用方法

### 效果图

![Image text](https://github.com/zhangrongbing/Component/blob/master/img-folder/Dialog.png)

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

## DialogController 提示框使用方法

### 效果图

![Image text](https://github.com/zhangrongbing/Component/blob/master/img-folder/Dialog.png)

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
    
## SheetController 抽屉菜单使用方法

### 效果图

![Image text](https://github.com/zhangrongbing/Component/blob/master/img-folder/Sheet.png)

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
