//
//  WBPasswordButtonView.m
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBPasswordButtonView.h"
#import "WBPasswordBussiness.h"

#define kWidth   50
#define kHeight  50

#define kSeperate_Heigh 20

#define kTopHeight      150

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGH  [UIScreen mainScreen].bounds.size.height


@interface WBPasswordButtonView()<WBPasswordBusinessPresenter>
@property  (nonatomic,  copy)    NSMutableArray   *unselectArray;
@property  (nonatomic,  copy)    NSMutableArray   *selectArray;

@property  (nonatomic,  copy)    NSMutableArray   *chooseArray;
@property  (nonatomic,  assign)  CGPoint          pointStart;
@property  (nonatomic,  assign)  CGPoint          pointEnd;
@property  (nonatomic,  strong)  UIImageView      *imageView;

@property  (nonatomic,  strong)  WBPasswordBussiness *passwordBusiness;
@end

@implementation WBPasswordButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.passwordBusiness = [[WBPasswordBussiness alloc]init];
        self.passwordBusiness.passDelegate = self;
        [self configNoramlView];
        
    }
    return self;
}


- (void)configNoramlView
{
    [self addSubview:self.imageView];
    for ( NSInteger i = 0; i < 3; i ++) {
        for ( NSInteger j = 0; j < 3; j++) {
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake((SCREEN_WIDTH - kWidth*3)/4 * (j+1) + j*kWidth, kTopHeight +i*kSeperate_Heigh +i*kHeight, kWidth, kHeight);
            [button setBackgroundImage:[UIImage imageNamed:@"password_unselect"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"password_select"] forState:UIControlStateSelected];
            button.userInteractionEnabled = NO;
            button.tag = i*3+j*2;
            [self.unselectArray addObject:button];
            [self addSubview:button];
            [self.imageView addSubview:button];
        }
    }
    
    UILabel  *rightbottLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 220, SCREEN_HEIGH - 100, 200, 44)];
    rightbottLabel.text = @"--Powerd by Mr.D";
    rightbottLabel.textAlignment = NSTextAlignmentRight;
    rightbottLabel.font = [UIFont systemFontOfSize:11];
    rightbottLabel.textColor = [UIColor whiteColor];
    [self addSubview:rightbottLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch  *touch = [touches anyObject];
  
    if (touch)
    {
        for (UIButton *btn in self.unselectArray) {
            CGPoint point = [touch locationInView:btn];
            if ([btn pointInside:point withEvent:nil]) {
                [self.selectArray addObject:btn];
                [self.chooseArray addObject:[NSString stringWithFormat:@"%@",@(btn.tag)]];
                btn.selected = YES;
                self.pointStart = btn.center;
            }
        }
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.pointEnd = [touch locationInView:self.imageView];
    if (touch) {
        for (UIButton *btn in self.unselectArray) {
            CGPoint point = [touch locationInView:btn];
            if ([btn pointInside:point withEvent:nil]) {
                BOOL isAdd = YES;
                for ( UIButton *selectBtn in self.selectArray) {
                    if (selectBtn == btn) {
                        isAdd = NO;
                        break;
                    }
                }
                if (isAdd) {
                    [self.selectArray addObject:btn];
                    [self.chooseArray addObject:[NSString stringWithFormat:@"%@",@(btn.tag)]];
                    btn.selected = YES;
                }
            }
        }
    }
    if (!(self.pointStart.x && self.pointStart.y == 0)) {
        self.imageView.image = [self drawLine];
    }
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.passwordBusiness validWithChooseArray:self.chooseArray];
}

#pragma mark -delegate
- (void)validPasswordWithTypeback:(WBPasswordValidType)type
{
    [self clearLine];
    switch (type) {
        case WBPasswordValidTypeSuccess:
        {
            if (self.passviewDelegate) {
                [self.passviewDelegate validResultShowUser:YES];
            }
        }
            break;
        case WBPasswordValidTypeFailWithPassword:
        {
            if (self.passviewDelegate) {
                [self.passviewDelegate validResultShowUser:NO];
            }
        }
            break;
        case WBPasswordValidTypeNOPassword:
        {
            if (self.passviewDelegate) {
                [self.passviewDelegate validResultShowUser:NO];
            }
        }
            break;
        case WBPasswordValidTypePasswordSubmit:
        {
            if (self.passviewDelegate) {
                [self.passviewDelegate validResultShowUser:NO];
            }
        }
            break;
        default:
            break;
    }
}

- (void)clearLine
{
    for (UIButton *btn in self.unselectArray) {
        btn.selected = NO;
    }
    self.chooseArray = nil;
    self.selectArray = nil;
    self.imageView.image = nil;
}

-(UIImage *)drawLine{
    UIImage *image = nil;
    UIColor *col = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIGraphicsBeginImageContext(self.imageView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, col.CGColor);
    CGContextMoveToPoint(context, self.pointStart.x, self.pointStart.y);
    for (UIButton *btn in self.selectArray) {
            CGPoint btnPo = btn.center;
            CGContextAddLineToPoint(context, btnPo.x, btnPo.y);
            CGContextMoveToPoint(context, btnPo.x, btnPo.y);
    }
    CGContextAddLineToPoint(context, self.pointEnd.x, self.pointEnd.y);
    CGContextStrokePath(context);
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
 }

- (NSMutableArray *)unselectArray
{
    if (!_unselectArray) {
        _unselectArray = [NSMutableArray new];
    }
    return _unselectArray;
}

- (NSMutableArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [NSMutableArray new];
    }
    return _selectArray;
}

- (NSMutableArray *)chooseArray
{
    if (!_chooseArray) {
        _chooseArray = [NSMutableArray new];
    }
    return _chooseArray;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGH)];
    }
    return _imageView;
}
@end
