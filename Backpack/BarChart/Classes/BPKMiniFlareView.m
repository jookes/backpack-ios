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

#import "BPKMiniFlareView.h"

#import <Foundation/Foundation.h>

#import <Backpack/Color.h>
#import <Backpack/Spacing.h>
#import <Backpack/Label.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPKMiniFlareView ()
@property(nonatomic) BPKLabel *label;
@end

@implementation BPKMiniFlareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self setupViews];
    }

    return self;
}

-(void)setupViews {
    self.backgroundColor = [BPKColor dynamicColorWithLightVariant:BPKColor.skyBlueShade02 darkVariant:BPKColor.blackTint06];

    [self.contentView addSubview:self.label];

    self.cornerRadius = BPKSpacingSm;

    [NSLayoutConstraint activateConstraints:@[
        [self.contentView.widthAnchor constraintEqualToAnchor:self.label.widthAnchor constant:2*BPKSpacingMd],
        [self.contentView.heightAnchor constraintEqualToAnchor:self.label.heightAnchor constant:2*BPKSpacingMd],
        [self.label.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
        [self.label.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor]
    ]];
}

- (BPKLabel *)label {
    if(_label != nil) {
        return _label;
    }

    _label = [[BPKLabel alloc ] initWithFontStyle:BPKFontStyleTextBase];
    _label.textColor = [BPKColor dynamicColorWithLightVariant:BPKColor.white darkVariant:BPKColor.black];
    return _label;
}

- (CGFloat)flareHeight {
    return BPKSpacingMd;
}

@end
NS_ASSUME_NONNULL_END
