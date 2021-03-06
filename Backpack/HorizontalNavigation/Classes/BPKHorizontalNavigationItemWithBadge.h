/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2021 Skyscanner Ltd
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

#import <Backpack/BPKHorizontalNavigationItem.h>
#import <UIKit/UIKit.h>

@class BPKBadge;

NS_ASSUME_NONNULL_BEGIN

@interface BPKHorizontalNavigationItemWithBadge : UIControl <BPKHorizontalNavigationItem>

/// :nodoc:
@property(nullable, nonatomic, strong) UIColor *selectedColor UI_APPEARANCE_SELECTOR;

/**
 * The size of the horizontal navigation.
 *
 * see BPKHorizontalNavigationSize
 */
@property(nonatomic) BPKHorizontalNavigationSize size;

@property(nonatomic) BPKHorizontalNavigationAppearance appearance;

/**
 * Create a `BPKHorizontalNavigationItemWithBadge` with a title  and a `BPKBadge`.
 *
 * @param title NSString the name for the navigation item
 * @param badgeMessage NSString the message for the badge
 */
- (instancetype)initWithTitle:(NSString *)title badgeMessage:(NSString *)badgeMessage;

@end

NS_ASSUME_NONNULL_END
