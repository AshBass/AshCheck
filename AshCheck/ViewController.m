//
//  ViewController.m
//  AshCheck
//
//  Created by Harry Houdini on 2019/7/26.
//  Copyright © 2019 CrimsonHo. All rights reserved.
//

#import "ViewController.h"
#import "CheckViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pushViewController:(UIButton *)sender {
    [self.navigationController pushViewController:[self checkViewController] animated:YES];
}

- (IBAction)presentViewController:(UIButton *)sender {
    [self presentViewController:[self checkViewController] animated:YES completion:^{
        
    }];
}

-(CheckViewController*)checkViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CheckViewController *checkViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CheckViewController class])];
    return checkViewController;
}

@end

