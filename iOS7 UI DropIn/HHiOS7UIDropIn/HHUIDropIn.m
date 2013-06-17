//
//  HHUIDropIn.m
//  iOS7 UI DropIn
//
//  Created by Hannes Hauer on 14.06.13.
//  Copyright (c) 2013 Hannes Hauer. All rights reserved.
//

#import "HHUIDropIn.h"
#import "UIImage+IPImageUtiles.h"

static NSString * const kNSStringConst = @"const value";


@interface HHUIDropIn ()
// Private Properties
@property (nonatomic, retain) UIColor *themeColor;
@property (nonatomic, retain) UIImage *transparentImage;
@end

@implementation HHUIDropIn
#pragma mark - Lifecycle
-(id)init {
    if (self = [super init]) {
        self.themeColor = [UIColor colorWithRed:0.08 green:0.49 blue:0.98 alpha:1];
        self.transparentImage = [UIImage imageNamed:@"TransparentImage.png"];
    }
    return self;
}

-(id)initWithThemeColor:(UIColor *)themeColor {
    if (self = [super init]) {
        self.themeColor = themeColor;
        self.transparentImage = [UIImage imageNamed:@"TransparentImage.png"];
    }
    return self;
}

-(void)dealloc {
    self.themeColor = nil;
    self.transparentImage = nil;
}

#pragma mark - Public Methods
-(void)replaceAllElements {
    [self replaceSegmentedControl];
    [self replaceNavigationBar];
    [self replaceSwitch];
    [self replaceStepper];
    [self replaceProgressView];
}

#pragma mark - Private Methods
-(void)replaceSegmentedControl {
    UIEdgeInsets backgroundInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    // Font
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    UIColor *fontColorSelected = [UIColor whiteColor];
    
    // Divider
    UIImage *dividerImageMasked = [UIImage ipMaskedImageNamed:@"SegmentedControlDivider.png" color:self.themeColor];
    [[UISegmentedControl appearance] setDividerImage:dividerImageMasked forLeftSegmentState:(UIControlStateNormal | UIControlStateSelected) rightSegmentState:(UIControlStateSelected | UIControlStateNormal) barMetrics:UIBarMetricsDefault];
    
    // Normal State
    UIImage *segmentedControlNormal = [UIImage ipMaskedImageNamed:@"SegmentedControlNormal.png" color:self.themeColor tiledCapInsets:backgroundInsets];
    [[UISegmentedControl appearance] setBackgroundImage:segmentedControlNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    NSDictionary *fontDictionaryNormal = [NSDictionary dictionaryWithObjectsAndKeys:font, UITextAttributeFont,
                                                                                    self.themeColor, UITextAttributeTextColor,
                                                                                    [UIColor clearColor], UITextAttributeTextShadowColor, nil];
    [[UISegmentedControl appearance] setTitleTextAttributes:fontDictionaryNormal forState:UIControlStateNormal];
    
    // Selected State
    UIImage *selectedImageMasked = [UIImage ipMaskedImageNamed:@"SegmentedControlSelected.png" color:self.themeColor];
    UIImage *selectedImageCapped = [selectedImageMasked resizableImageWithCapInsets:backgroundInsets resizingMode:UIImageResizingModeTile];
    [[UISegmentedControl appearance] setBackgroundImage:selectedImageCapped forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    NSDictionary *fontDictionarySelected = [NSDictionary dictionaryWithObjectsAndKeys:font, UITextAttributeFont,
                                                                                        fontColorSelected, UITextAttributeTextColor,
                                                                                        [UIColor clearColor], UITextAttributeTextShadowColor, nil];
    [[UISegmentedControl appearance] setTitleTextAttributes:fontDictionarySelected forState:UIControlStateSelected];
}

-(void)replaceNavigationBar {
    // Common
    // Background Color
    //UIColor *backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    // Background
    NSString *backgroundImageString = [[NSBundle mainBundle] pathForResource:@"NavigationBar-Background" ofType:@"png"];
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:backgroundImageString];
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    // Bar Button Items
    UIFont *barButtonItemFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    NSDictionary *barButtonItemFontDictionary = [NSDictionary dictionaryWithObjectsAndKeys:barButtonItemFont, UITextAttributeFont,
                                                                                            self.themeColor, UITextAttributeTextColor,
                                                                                            [UIColor clearColor], UITextAttributeTextShadowColor, nil];
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonItemFontDictionary forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setBackgroundImage:self.transparentImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // Navigation Bar Title
    UIFont *navigationBarTitleFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
    UIColor *navigationBarTitleColor = [UIColor blackColor];
    NSDictionary *navigationBarTitleDictionary = [NSDictionary dictionaryWithObjectsAndKeys:navigationBarTitleFont, UITextAttributeFont,
                                                                                            navigationBarTitleColor, UITextAttributeTextColor,
                                                                                            [UIColor clearColor], UITextAttributeTextShadowColor, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navigationBarTitleDictionary];
    
    // Back Button - Custom Background Image
    UIImage *backIconMasked = [UIImage ipMaskedImageNamed:@"BackIcon-Mask.png" color:self.themeColor];
    UIImage *backIconResized = [backIconMasked resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 0) resizingMode:UIImageResizingModeTile];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backIconResized forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(6, 0) forBarMetrics:UIBarMetricsDefault];
    
}

-(void)replaceSwitch {
    // Needs programming to change Size and exact appearance
    [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:0.33 green:0.84 blue:0.41 alpha:1]];
    [[UISwitch appearance] setOnImage:self.transparentImage];
    [[UISwitch appearance] setOffImage:self.transparentImage];
    
}

-(void)replaceStepper {
    // Background
    UIImage *stepperBackground = [UIImage ipMaskedImageNamed:@"StepperBG.png" color:self.themeColor tiledCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
    [[UIStepper appearance] setBackgroundImage:stepperBackground forState:UIControlStateNormal];
    [[UIStepper appearance] setBackgroundImage:stepperBackground forState:UIControlStateDisabled];
    
    // Decrement Image
    UIImage *decrementDisabledMasked = [UIImage ipMaskedImageNamed:@"DecrementDisabled.png" color:self.themeColor];
    [[UIStepper appearance] setDecrementImage:decrementDisabledMasked forState:UIControlStateDisabled];
    UIImage *decrementNormalMasked = [UIImage ipMaskedImageNamed:@"DecrementNormal.png" color:self.themeColor];
    [[UIStepper appearance] setDecrementImage:decrementNormalMasked forState:UIControlStateNormal];
    
    // Increment Image
    UIImage *incrementDisabledMasked = [UIImage ipMaskedImageNamed:@"IncrementDisabled.png" color:self.themeColor];
    [[UIStepper appearance] setIncrementImage:incrementDisabledMasked forState:UIControlStateDisabled];
    UIImage *incrementNormalMasked = [UIImage ipMaskedImageNamed:@"IncrementNormal.png" color:self.themeColor];
    [[UIStepper appearance] setIncrementImage:incrementNormalMasked forState:UIControlStateNormal];
    
    // Divider
    UIImage *dividerImageLeftRightNormal = [UIImage ipMaskedImageNamed:@"StepperDividerLeftRightNormal.png" color:self.themeColor];
    [[UIStepper appearance] setDividerImage:dividerImageLeftRightNormal forLeftSegmentState:UIControlStateNormal
                                                                        rightSegmentState:UIControlStateNormal];
    UIImage *dividerImageLeftRightDisabled = [UIImage ipMaskedImageNamed:@"StepperDividerLeftRightDisabled.png" color:self.themeColor];
    [[UIStepper appearance] setDividerImage:dividerImageLeftRightDisabled forLeftSegmentState:UIControlStateDisabled
                                                                            rightSegmentState:UIControlStateDisabled];
    UIImage *dividerImageLeftDisabledRightNormal = [UIImage ipMaskedImageNamed:@"StepperDividerLeftDisabledRightNormal.png" color:self.themeColor];
    [[UIStepper appearance] setDividerImage:dividerImageLeftDisabledRightNormal forLeftSegmentState:UIControlStateDisabled
                                                                                rightSegmentState:UIControlStateNormal];
    UIImage *dividerImageLeftNormalRightDisabled = [UIImage ipMaskedImageNamed:@"StepperDividerLeftNormalRightDisabled.png" color:self.themeColor];
    [[UIStepper appearance] setDividerImage:dividerImageLeftNormalRightDisabled forLeftSegmentState:UIControlStateNormal
                                                                                rightSegmentState:UIControlStateDisabled];
}

-(void)replaceProgressView {
    
    // Replace Images - Use ThemeColor for TrackImage; track = background form navigation bar!?
    [[UIProgressView appearance] setProgressTintColor:self.themeColor];
    /*
@property(nonatomic, retain) UIImage* progressImage
@property(nonatomic, retain) UIColor* progressTintColor
@property(nonatomic, retain) UIImage* trackImage
@property(nonatomic, retain) UIColor* trackTintColor
*/
    
}

// UIActivityIndicator: ?
// UIPageControl: ?
// UIProgressView: ?
// UISearchBar: ?
// UITabBar: ?
// UITabBarItem: ?
// UITableViewHeaderFooterView: ? tintColor same as background in NavigationBar?
// UIToolbar: ?

// UIButton: Nothing necessary, simply set to Style: Custom
// UIRefreshControl: Unknown
// UITableView: Use ThemeColor for sectionIndexColor
// UISlider: Needs Subclassing


@end
