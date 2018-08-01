//
//  ViewController.m
//  toolBar
//
//  Created by lm on 16/4/17.
//  Copyright © 2016年 lm. All rights reserved.
//

#import "ViewController.h"
#import "LMComposeTool.h"

#define toolBarH 50
#define toolBarW self.view.frame.size.width
#define toolBarY self.view.frame.size.height - toolBarH
@interface ViewController ()<LMComposeToolBarDelegate>

@property (nonatomic, strong) LMComposeTool *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor grayColor];
    
    LMComposeTool *tool = [[LMComposeTool alloc] initWithFrame:CGRectMake(0, toolBarY, toolBarW, toolBarH)];
    tool.delegate = self;
    [self.view addSubview:tool];
    self.toolbar = tool;
    
    
}

- (void)viewWillAppear:(BOOL)animated {

    [self registerForKeyboardNotificatioons];
}

- (void)viewWillDisappear:(BOOL)animated {

    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)registerForKeyboardNotificatioons {

    // 增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    // 增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)keyboardWillShow:(NSNotification *)aNotification {

    // 获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    NSLog(@"键盘的高:%d", height);
    
    self.toolbar.frame = CGRectMake(0, toolBarY, toolBarW, toolBarH + height);
}

- (void)keyboardWillHide:(NSNotification *)aNotification {
    
    self.toolbar.frame = CGRectMake(0, toolBarY, toolBarW, toolBarH);
}

#pragma mark - HMComposeToolbarDelegate
/**
 *  监听toolbar内部按钮的点击
 */
- (void)composetool:(LMComposeTool *)toolbar diclickButton:(LMComposeToolBarType)buttonType {
    
    switch (buttonType) {
        case LMComposeToolBarTypeEmoti:
            [self openEmoti];
            break;
        case LMComposeToolBarTypeMore:
            [self openMore];
            break;
        case LMComposeToolBarTypeVocie:
            [self openeVocie];
            break;
//        case LMComposeToolBarTypeTextField:
//            [self changeFrameToToolbar];
//            break;
        default:
            break;
    }
}
- (void)openEmoti {
    
    NSLog(@"openEmoti");
}
- (void)openMore {
    
    NSLog(@"openMore");
}
- (void)openeVocie {
    
    NSLog(@"openeVocie");
}

@end
