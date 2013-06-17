//
//  UIImage+IPImageUtiles.m
//  iOS7 UI DropIn
//
//  Created by Hannes Hauer on 14.06.13.
//  Copyright (c) 2013 Hannes Hauer. All rights reserved.
//

#import "UIImage+IPImageUtiles.h"

@implementation UIImage (IPImageUtiles)

+ (UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color
{
	UIImage *image = [UIImage imageNamed:name];
	CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
	CGContextRef c = UIGraphicsGetCurrentContext();
	[image drawInRect:rect];
	CGContextSetFillColorWithColor(c, [color CGColor]);
	CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
	CGContextFillRect(c, rect);
	UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return result;
}

+(UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color tiledCapInsets:(UIEdgeInsets)insets {
    return [self ipMaskedImageNamed:name color:color capInsets:insets resizingMode:UIImageResizingModeTile];
}

+ (UIImage *)ipMaskedImageNamed:(NSString *)name color:(UIColor *)color capInsets:(UIEdgeInsets)insets resizingMode:(UIImageResizingMode)resizingMode {
    UIImage *maskedImage = [self ipMaskedImageNamed:name color:color];
    UIImage *result = [maskedImage resizableImageWithCapInsets:insets resizingMode:resizingMode];
    return result;
}

@end
