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

#import "BPKBarChartCollectionViewCell.h"

#import <Foundation/Foundation.h>

#import <Backpack/Color.h>
#import <Backpack/Spacing.h>
#import <Backpack/Label.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPKBarChartCollectionViewCell ()
@property(nonatomic) BPKBarChartBar *barChartBar;
@end

@implementation BPKBarChartCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self setupViews];
    }

    return self;
}

-(void)setupViews {
    [self.contentView addSubview:self.barChartBar];

    [NSLayoutConstraint activateConstraints:@[
    [self.barChartBar.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
    [self.barChartBar.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
    [self.contentView.trailingAnchor constraintEqualToAnchor:self.barChartBar.trailingAnchor],
    [self.contentView.bottomAnchor constraintEqualToAnchor:self.barChartBar.bottomAnchor]
    ]];
}

- (BPKBarChartBar *)barChartBar {
    if(_barChartBar != nil) {
        return _barChartBar;
    }

    _barChartBar = [BPKBarChartBar new];
    _barChartBar.translatesAutoresizingMaskIntoConstraints = NO;
    _barChartBar.userInteractionEnabled = NO;
    return _barChartBar;
}

@end
NS_ASSUME_NONNULL_END
