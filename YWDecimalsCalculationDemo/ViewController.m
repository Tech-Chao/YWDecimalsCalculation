//
//  ViewController.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import "ViewController.h"
#import "NSString+DecimalsCalculation.h"
#import "YWStringNumberHandler.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstTextfield;
@property (weak, nonatomic) IBOutlet UITextField *secondTextfield;
@property (weak, nonatomic) IBOutlet UILabel *labResult;

@property (nonatomic, weak) UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;

@property (nonatomic, strong) YWStringNumberHandler *handler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnSelected:self.plusBtn];
    
    // 加法作自定义结果处理
    _handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain scale:4 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES isAutoFilling:YES];
}

- (IBAction)btnSelected:(UIButton *)sender {
    if (self.selectedBtn != sender) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }
}


- (IBAction)getResult:(UIButton *)sender {
    NSString *str  = nil;
    
    
    switch (self.selectedBtn.tag) {
        case 1:
            str = [self.firstTextfield.text yw_stringNumberByAdding:self.secondTextfield.text withBehavior:_handler];
            break;
        case 2:
            str =  [self.firstTextfield.text yw_stringNumberBySubtracting:self.secondTextfield.text];
            break;
        case 3:
            str =   [self.firstTextfield.text yw_stringNumberByMultiplyingBy:self.secondTextfield.text];
            break;
        case 4:
            str =  [self.firstTextfield.text yw_stringNumberByDividingBy:self.secondTextfield.text];
            break;
        default:
            break;
    }
    
    self.labResult.text = str;
}


@end
