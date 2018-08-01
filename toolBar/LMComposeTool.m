//
//  LMComposeTool.m
//  toolBar
//
//  Created by lm on 16/4/18.
//  Copyright © 2016年 lm. All rights reserved.
//

#define space 10

#import "LMComposeTool.h"

@interface LMComposeTool ()

@property (nonatomic, strong) UIButton *voiceBtn;
@property (nonatomic, strong) UIButton *emotiBtn;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation LMComposeTool

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        // 添加子控件
        // 模仿QQ的样式，有语音、文本框、表情、发送
        _voiceBtn = [self addButtonWithTitle:@"音" tag:LMComposeToolBarTypeVocie];
        _emotiBtn = [self addButtonWithTitle:@"表" tag:LMComposeToolBarTypeEmoti];
        _moreBtn = [self addButtonWithTitle:@"多" tag:LMComposeToolBarTypeMore];
        _textField = [self addTextFieldWithPlaceholder:@"输入消息"];
    }
    return self;
}

- (UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder {
     UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"输入消息";
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 5.0;
    [self addSubview:textField];
    return textField;
}

- (UIButton *)addButtonWithTitle:(NSString *)title tag:(LMComposeToolBarType)tag{
    
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    return button;
}

- (void)buttonClick:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(composetool:diclickButton:)]) {
        [self.delegate composetool:self diclickButton:(int)button.tag];
    }
}

// 设置Frame
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat btn_h = self.frame.size.height - space * 2;
    self.voiceBtn.frame = CGRectMake(space, space, btn_h, btn_h);
    
    CGFloat moreBtn_x = self.frame.size.width - btn_h - space;
    self.moreBtn.frame = CGRectMake(moreBtn_x, space, btn_h, btn_h);
    
//    CGFloat emotiBtn_x = CGRectGetMaxX(self.voiceBtn.frame)+space;
    CGFloat emotiBtn_x = CGRectGetMinX(self.moreBtn.frame) - space - btn_h;
    self.emotiBtn.frame = CGRectMake(emotiBtn_x, space, btn_h, btn_h);
    
    CGFloat textField_x = CGRectGetMaxX(self.voiceBtn.frame) + space;
    CGFloat textField_w = emotiBtn_x - CGRectGetMaxX(self.voiceBtn.frame) - 2*space;
    self.textField.frame = CGRectMake(textField_x, space, textField_w, btn_h);
    
    self.voiceBtn.layer.cornerRadius = btn_h/2;
    self.emotiBtn.layer.cornerRadius = btn_h/2;
    self.moreBtn.layer.cornerRadius = btn_h/2;
}

@end
