/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2020 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "BPKBarChartBar.h"

#import <Foundation/Foundation.h>

#import <Backpack/Color.h>
#import <Backpack/Spacing.h>
#import <Backpack/Label.h>

#import "BPKMiniFlareView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPKBarChartBar ()
@property(nonatomic) NSLayoutConstraint* barViewHeightAnchor;
@property(nonatomic) NSLayoutConstraint* miniFlareViewPositionAnchor;
@property(nonatomic) UIColor* noValueColor;
@property(nonatomic) UIColor* valueColor;
@property(nonatomic) UIColor* selectedColor;
@property(nonatomic) BPKLabel* titleLabel;
@property(nonatomic) BPKLabel* subtitleLabel;
@property(nonatomic) UIView* backgroundView;
@property(nonatomic) UIView* barView;
@property(nonatomic) BPKMiniFlareView* miniFlareView;
@end

@implementation BPKBarChartBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self setupViews];
    }

    return self;
}

-(void)setupViews {
    [self addSubview:self.backgroundView];
    [self addSubview:self.barView];
    [self addSubview:self.miniFlareView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleLabel];

    [NSLayoutConstraint activateConstraints:@[
        [self.backgroundView.widthAnchor constraintEqualToConstant:BPKSpacingBase],
        [self.barView.widthAnchor constraintEqualToConstant:BPKSpacingBase],
        [self.barView.bottomAnchor constraintEqualToAnchor:self.backgroundView.bottomAnchor],
        [self.barView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.backgroundView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.backgroundView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.miniFlareView.centerXAnchor constraintEqualToAnchor:self.backgroundView.centerXAnchor],
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.backgroundView.centerXAnchor],
        [self.subtitleLabel.centerXAnchor constraintEqualToAnchor:self.backgroundView.centerXAnchor],
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.backgroundView.bottomAnchor constant:BPKSpacingMd],
        [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:BPKSpacingMd],
        [self.bottomAnchor constraintEqualToAnchor:self.subtitleLabel.bottomAnchor constant:BPKSpacingMd],
    ]];


    [self updateBarHeight];
    [self updateminiFlareViewAppearance];
}

- (UIView *)backgroundView {
    if(_backgroundView != nil) {
        return _backgroundView;
    }

    _backgroundView = [UIView new];
    _backgroundView.backgroundColor = [BPKColor dynamicColorWithLightVariant:BPKColor.skyGrayTint06 darkVariant:BPKColor.blackTint03];
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    _backgroundView.layer.cornerRadius = BPKSpacingMd;
    return _backgroundView;
}

- (UIView *)barView {
    if(_barView != nil) {
        return _barView;
    }

    _barView = [UIView new];
    _barView.backgroundColor = self.noValueColor;
    _barView.translatesAutoresizingMaskIntoConstraints = NO;
    _barView.layer.cornerRadius = BPKSpacingMd;
    return _barView;
}

- (BPKMiniFlareView *)miniFlareView {
    if(_miniFlareView != nil) {
        return _miniFlareView;
    }

    _miniFlareView = [BPKMiniFlareView new];
    _miniFlareView.translatesAutoresizingMaskIntoConstraints = NO;
    return _miniFlareView;
}

- (BPKLabel *)titleLabel {
    if(_titleLabel != nil) {
        return _titleLabel;
    }

    _titleLabel = [[BPKLabel alloc] initWithFontStyle:BPKFontStyleTextBaseEmphasized];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _titleLabel;
}

- (BPKLabel *)subtitleLabel {
    if(_subtitleLabel != nil) {
        return _subtitleLabel;
    }

    _subtitleLabel = [[BPKLabel alloc] initWithFontStyle:BPKFontStyleTextSm];
    _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _subtitleLabel;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];

    [self updateBarColor];
    [self updateminiFlareViewAppearance];
}

- (void)setFillValue:(NSNumber *_Nullable)fillValue {
    if(_fillValue != fillValue) {
        _fillValue = fillValue;

        [self updateBarHeight];
        [self updateBarColor];
    }
}

- (NSString *_Nullable)valueDescription {
    return self.miniFlareView.text;
}

- (void)setValueDescription:(NSString *_Nullable)valueDescription {
    self.miniFlareView.text = valueDescription;
    [self updateminiFlareViewAppearance];
}

- (NSString *_Nullable)title {
    return self.titleLabel.text;
}

- (void)setTitle:(NSString *_Nullable)title {
    self.titleLabel.text = title;
}

- (NSString *_Nullable)subtitle {
    return self.subtitleLabel.text;
}

- (void)setSubtitle:(NSString *_Nullable)subtitle {
    self.subtitleLabel.text = subtitle;
}

- (CGFloat)barTopPosition {
    return self.barView.frame.origin.y;
}

+ (UIColor *)noValueColor {
    return BPKColor.skyGrayTint03;
}

+ (UIColor *)valueColor {
    return BPKColor.primaryColor;
}

+ (UIColor *)selectedColor {
    return [BPKColor dynamicColorWithLightVariant:BPKColor.monteverde darkVariant:BPKColor.glencoe];
}

-(void)updateBarColor {
    if (self.isSelected) {
        self.barView.backgroundColor = self.class.selectedColor;
        self.titleLabel.textColor = BPKBarChartBar.selectedColor;
        self.subtitleLabel.textColor = BPKBarChartBar.selectedColor;
        return;
    }

    self.titleLabel.textColor = BPKColor.textPrimaryColor;
    self.subtitleLabel.textColor = BPKColor.textPrimaryColor;
    self.barView.backgroundColor = self.fillValue != nil ? BPKBarChartBar.valueColor : BPKBarChartBar.noValueColor;
}

-(void)updateBarHeight {
    if (self.barViewHeightAnchor != nil) {
        self.barViewHeightAnchor.active = false;
    }

    self.barViewHeightAnchor = self.fillValue != nil ?
    [self.barView.heightAnchor constraintEqualToAnchor:self.backgroundView.heightAnchor multiplier:[self.fillValue doubleValue]] :
    [self.barView.heightAnchor constraintEqualToConstant:BPKSpacingLg];

    NSAssert(self.barViewHeightAnchor != nil, @"barViewHeightAnchor should not be nil");
    self.barViewHeightAnchor.active = true;
}

-(void)updateminiFlareViewAppearance {
    if (self.miniFlareViewPositionAnchor != nil) {
        self.miniFlareViewPositionAnchor.active = false;
    }

    self.miniFlareViewPositionAnchor = [self.miniFlareView.bottomAnchor constraintEqualToAnchor:self.barView.topAnchor constant:-BPKSpacingSm];

    NSAssert(self.barViewHeightAnchor != nil, @"miniFlareViewPositionAnchor should not be nil");
    self.miniFlareViewPositionAnchor.active = true;

    self.miniFlareView.hidden = self.valueDescription == nil || !self.isSelected;
}

@end
NS_ASSUME_NONNULL_END
