//
//  LLPhoneViewController.m
//  BaiduMap
//
//  Created by WangZhaomeng on 2017/6/15.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLPhoneViewController.h"

@interface LLPhoneViewController ()

@end

@implementation LLPhoneViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"更换手机号";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:222/255. green:222/255. blue:222/255. alpha:1];
    [self createViews];
}

- (void)createViews {
    
    UILabel *originalPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH-20, 40)];
    originalPhoneLabel.text = [NSString stringWithFormat:@"旧手机号码：%@",[self handlePhone:_originalPhone]];
    originalPhoneLabel.textColor = [UIColor darkGrayColor];
    originalPhoneLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:originalPhoneLabel];
    
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(originalPhoneLabel.frame)+10, SCREEN_WIDTH, 101)];
    inputView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputView];
    
    UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(inputView.frame)-100, 30)];
    phoneTextField.placeholder = @"手机号";
    [inputView addSubview:phoneTextField];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(phoneTextField.frame)+10, SCREEN_WIDTH-20, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:222/255. green:222/255. blue:222/255. alpha:1];
    [inputView addSubview:lineView];
    
    UITextField *codeTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lineView.frame)+10, CGRectGetWidth(inputView.frame)-20, 30)];
    codeTextField.placeholder = @"验证码";
    [inputView addSubview:codeTextField];
    
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.tag = 0;
    codeBtn.frame = CGRectMake(SCREEN_WIDTH-100, 12.5, 80, 25);
    codeBtn.layer.masksToBounds = YES;
    codeBtn.layer.cornerRadius = 5;
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [codeBtn setBackgroundImage:[UIImage ll_imageWithColor:[UIColor colorWithRed:60/255. green:170/255. blue:70/255. alpha:1]] forState:UIControlStateNormal];
    [codeBtn setBackgroundImage:[UIImage ll_imageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [codeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:codeBtn];
    
    UIButton *OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    OKBtn.tag = 1;
    OKBtn.frame = CGRectMake(10, CGRectGetMaxY(inputView.frame)+20, SCREEN_WIDTH-20, 40);
    OKBtn.layer.masksToBounds = YES;
    OKBtn.layer.cornerRadius = 5;
    OKBtn.enabled = NO;
    [OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    [OKBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [OKBtn setBackgroundImage:[UIImage ll_imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [OKBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OKBtn];
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 0) {//发送验证码
        
    }
    else {//确定
        
    }
}

- (NSString *)handlePhone:(NSString *)phone {
    if (phone.length == 11) {
        return [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return phone;
}

@end
