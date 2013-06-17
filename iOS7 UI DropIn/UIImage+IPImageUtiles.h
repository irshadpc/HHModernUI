//
//  UIImage+IPImageUtiles.h
//  iOS7 UI DropIn
//
//  Created by Hannes Hauer on 14.06.13.
//  Copyright (c) 2013 Hannes Hauer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IPImageUtiles)
+ (UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color;
+ (UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color tiledCapInsets:(UIEdgeInsets)insets;
+ (UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color capInsets:(UIEdgeInsets)insets resizingMode:(UIImageResizingMode)resizingMode;
@end
