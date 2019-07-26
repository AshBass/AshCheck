//
//  UIViewController+AshCheck.m
//  AshCheck
//
//  Created by Harry Houdini on 2019/7/26.
//  Copyright © 2019 CrimsonHo. All rights reserved.
//

#import "UIViewController+AshCheck.h"
#import <objc/runtime.h>
#import "AshCheck.h"

@implementation UIViewController (AshCheck)

+(void)load {
    Method dismissMethod = class_getInstanceMethod(self, @selector(dismissViewControllerAnimated:completion:));
    Method ashDismissMethod = class_getInstanceMethod(self, @selector(ashCheck_dismissViewControllerAnimated:completion:));
    method_exchangeImplementations(dismissMethod, ashDismissMethod);
}

-(void)ashCheck_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [[AshCheck defaultChecker] checkViewController:self];
    [self ashCheck_dismissViewControllerAnimated:flag completion:completion];
}

@end
