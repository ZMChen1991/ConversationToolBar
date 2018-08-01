//
//  LMComposeTool.h
//  toolBar
//
//  Created by lm on 16/4/18.
//  Copyright © 2016年 lm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LMComposeToolBarTypeVocie,  // 语音
    LMComposeToolBarTypeEmoti,  // 表情
    LMComposeToolBarTypeMore,   // 更多
    LMComposeToolBarTypeTextField   // 文本
} LMComposeToolBarType;

@class LMComposeTool;
@protocol LMComposeToolBarDelegate <NSObject>

@optional // 可选
- (void)composetool:(LMComposeTool *)toolbar diclickButton:(LMComposeToolBarType)buttonType;

@end

@interface LMComposeTool : UIView

@property (nonatomic, weak) id<LMComposeToolBarDelegate> delegate;

@end
