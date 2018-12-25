//
//  LRTableModel.h
//  LROCLabel
//
//  Created by dalizi on 2018/12/24.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,LRTableViewButtonType) {
    LRTableViewButtonTypeNone,
    LRTableViewButtonTypeNoButton, //文字够展示全，不需要展开收起按钮
    LRTableViewButtonTypeButtonExpand, //文字展示不全，显示展开按钮
    LRTableViewButtonTypeButtonCollapse, //文字展示完全，显示收起按钮
};

@interface LRTableModel : NSObject

@property (nonatomic,assign) LRTableViewButtonType buttonType;
@property (nonatomic,copy)   NSString              *title;

@end
