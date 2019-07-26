
#import "AshCheck.h"
#import "UIViewController+AshCheck.h"
#import "UIViewController+MemeroyCheck.h"

static AshCheck *checker;

@interface AshCheck ()

@end

@implementation AshCheck

+(instancetype)defaultChecker {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        checker = [[AshCheck alloc] init];
    });
    return checker;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)checkViewController:(UIViewController*)viewController {
    __weak typeof(viewController) weakViewController = viewController;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakViewController) {
            [weakViewController ashCheck_check];
        }
    });
}

@end
