//
//  UILabel+ChangeFont.m
//  MCChangeLabelFont-OC
//
//  Created by machao on 16/5/25.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "UILabel+ChangeFont.h"
#import <objc/runtime.h>

@implementation UILabel (ChangeFont)

+ (void)load
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

    SEL originalSelector = @selector(init);
    SEL originalSelector2 = @selector(initWithFrame:);
    SEL originalSelector3 = @selector(awakeFromNib);
    SEL swizzledSelector = @selector(MCInit);
    SEL swizzledSelector2 = @selector(MCInitWithFrame:);
    SEL swizzledSelector3 = @selector(MCAwakeFromNib);
    

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
    Method originalMethod3 = class_getInstanceMethod(class, originalSelector3);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    Method swizzledMethod2 = class_getInstanceMethod(class, swizzledSelector2);
    Method swizzledMethod3 = class_getInstanceMethod(class, swizzledSelector3);
        
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    BOOL didAddMethod2 =
    class_addMethod(class,
                    originalSelector2,
                    method_getImplementation(swizzledMethod2),
                    method_getTypeEncoding(swizzledMethod2));
    BOOL didAddMethod3 =
    class_addMethod(class,
                    originalSelector3,
                    method_getImplementation(swizzledMethod3),
                    method_getTypeEncoding(swizzledMethod3));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    if (didAddMethod2) {
        class_replaceMethod(class,
                            swizzledSelector2,
                            method_getImplementation(originalMethod2),
                            method_getTypeEncoding(originalMethod2));
    }else {
        method_exchangeImplementations(originalMethod2, swizzledMethod2);
    }
    if (didAddMethod3) {
        class_replaceMethod(class,
                            swizzledSelector3,
                            method_getImplementation(originalMethod3),
                            method_getTypeEncoding(originalMethod3));
    }else {
        method_exchangeImplementations(originalMethod3, swizzledMethod3);
    }
    });
    
    
}

- (instancetype)MCInit
{
    id __self = [self MCInit];
    
    if (self) {
        // 需要改变字体的大小，和一些其他的设置
        self.font= [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor orangeColor];
    }
    
    return __self;
}

-(instancetype)MCInitWithFrame:(CGRect)rect{
    id __self = [self MCInitWithFrame:rect];
    
    if (self) {
        // 需要改变字体的大小，和一些其他的设置
        self.font= [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor redColor];
    }
    return __self;
}

-(void)MCAwakeFromNib{
    [self MCAwakeFromNib];
    if (self) {
        // 需要改变字体的大小，和一些其他的设置
        self.font= [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor blueColor];
    }
    
}

@end
