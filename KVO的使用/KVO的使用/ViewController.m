//
//  ViewController.m
//  KVO的使用
//
//  Created by Sun on 2019/10/20.
//  Copyright © 2019 Sun. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *p1;
@property (nonatomic, strong) Person *p2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p1 = [[Person alloc] init];
    self.p1.age = 1;
    self.p1.height = 180;
    
    self.p2 = [[Person alloc] init];
    self.p2.age = 2;
    self.p2.height = 190;
    
    // 给对象 p1 添加观察者
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
}

// 更改属性值
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.p1.age = 10;
    self.p2.age = 20;
    
    self.p1.height = 90;
    self.p2.height = 100;
}

// 释放观察者
- (void)dealloc {
    [self.p1 removeObserver:self forKeyPath:@"age"];
}

// 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@, %@, %@, %@", keyPath, object, change, context);
}

@end
