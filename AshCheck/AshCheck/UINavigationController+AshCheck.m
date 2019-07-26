//
//  UINavigationController+AshCheck.m
//  AshCheck
//
//  Created by Harry Houdini on 2019/7/26.
//  Copyright © 2019 CrimsonHo. All rights reserved.
//

#import "UINavigationController+AshCheck.h"
#import <objc/runtime.h>
#import "AshCheck.h"

@implementation UINavigationController (AshCheck)

+(void)load {
    Method popMethod = class_getInstanceMethod(self, @selector(popViewControllerAnimated:));
    Method ashPopMethod = class_getInstanceMethod(self, @selector(ashCheck_popViewControllerAnimated:));
    method_exchangeImplementations(popMethod, ashPopMethod);
}

-(void)ashCheck_popViewControllerAnimated:(BOOL)animation {
    [[AshCheck defaultChecker] checkViewController:self.topViewController];
    [self ashCheck_popViewControllerAnimated:animation];
}

@end
