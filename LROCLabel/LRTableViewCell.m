//
//  LRTableViewCell.m
//  LROCLabel
//
//  Created by dalizi on 2018/12/24.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "LRTableViewCell.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "LRTableModel.h"
#import <Masonry/Masonry.h>

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

@interface LRTableViewCell ()
@property (nonatomic,strong) UILabel  *autoLabel;
@property (nonatomic,strong) UIButton *autoButton;
@end

@implementation LRTableViewCell

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configSubviews];
    }
    return self;
}

- (void)configSubviews {
    //
    self.autoLabel = ({
        UILabel *label        = [UILabel new];
        label.font            = [UIFont systemFontOfSize:15];
        label.textColor       = [UIColor darkGrayColor];
        label.numberOfLines   = 0;
        label;
    });
    self.autoButton = ({
        UIButton *button       = [UIButton new];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"展开" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor orangeColor]];
        button;
    });
    [self.contentView addSubview:self.autoLabel];
    [self.contentView addSubview:self.autoButton];
    //
    self.autoLabel.preferredMaxLayoutWidth = SCREENW - 30;
    [self.autoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).mas_offset(10);
        make.left.equalTo(self.contentView.mas_left).mas_offset(15);
        make.right.equalTo(self.contentView.mas_right);
    }];
    
    [self.autoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.autoLabel.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        make.right.equalTo(self.contentView.mas_right).mas_offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10).priorityHigh();
    }];
    self.autoButton.layer.cornerRadius = 5.0f;
}

/*
 * public
 */
- (void)reloadCell:(LRTableModel *)cellModel {
    
    self.autoLabel.text = cellModel.title;
    NSArray *lineArray  = [self getLastLinesFromLabel:self.autoLabel];
    
    if (cellModel.buttonType == LRTableViewButtonTypeNone) {
        if (lineArray.count > 2) {
            cellModel.buttonType = LRTableViewButtonTypeButtonExpand;
        } else {
            cellModel.buttonType = LRTableViewButtonTypeNoButton;
        }
    }
    
    if (cellModel.buttonType == LRTableViewButtonTypeButtonExpand) {
        CGRect   rect       = [[lineArray lastObject] boundingRectWithSize:CGSizeMake(SCREENW - 30, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.autoLabel.font} context:nil];
        [self.autoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).mas_offset(10);
            make.left.equalTo(self.contentView.mas_left).mas_offset(15);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(rect.size.height + 1);
        }];
        
        [self.autoButton setHidden:NO];
        [self.autoButton setTitle:@"展开" forState:UIControlStateNormal];
    } else if (cellModel.buttonType == LRTableViewButtonTypeButtonCollapse) {
        CGRect   rect       = [self.autoLabel.text boundingRectWithSize:CGSizeMake(SCREENW - 30, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.autoLabel.font} context:nil];
        [self.autoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).mas_offset(10);
            make.left.equalTo(self.contentView.mas_left).mas_offset(15);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(rect.size.height + 1);
        }];
        
        [self.autoButton setHidden:NO];
        [self.autoButton setTitle:@"收起" forState:UIControlStateNormal];
    } else if (cellModel.buttonType == LRTableViewButtonTypeNoButton) {
        [self.autoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).mas_offset(10);
            make.left.equalTo(self.contentView.mas_left).mas_offset(15);
            make.right.equalTo(self.contentView.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10);
        }];

        [self.autoButton setHidden:YES];
    }
}

/*
 * 计算最后一行string的Rect得到全文/收起按钮的位置
 */
- (NSArray *)getLastLinesFromLabel:(UILabel *)label {
    if (label.text.length == 0) {
        return nil;
    }
    //
    NSString *text = [label text];
    UIFont   *font = [label font];
    CGRect    rect = CGRectMake(label.frame.origin.x, label.frame.origin.y, SCREENW - 30, label.frame.size.height);
    //
    CFStringRef fontName   = (__bridge CFStringRef)[font fontName];
    CGFloat     size       = [font pointSize];
    CTFontRef   labelFont  = CTFontCreateWithName(fontName, size, NULL);
    //
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)labelFont range:NSMakeRange(0, attributeString.length)];
    //
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributeString);
    CGMutablePathRef path        = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    CTFrameRef       frame       = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    //
    NSArray          *lines      = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray   *linesArray = [NSMutableArray new];
    [lines enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CTLineRef    lineRef     = (__bridge CTLineRef)obj;
        CFRange      lineRange   = CTLineGetStringRange(lineRef);
        NSRange      range       = NSMakeRange(lineRange.location, lineRange.length);
        NSString     *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attributeString, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        [linesArray addObject:lineString];
    }];
    // release
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

@end
