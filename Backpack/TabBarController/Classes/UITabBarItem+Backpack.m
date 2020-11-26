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

#import "UIView+BPKRTL.h"

#import <Backpack/Color.h>

NS_ASSUME_NONNULL_BEGIN

@implementation UITabBarItem (Backpack)

- (void)bpk_addDotWithColor:(UIColor *)color {
    self.badgeColor = BPKColor.clear;
    self.badgeValue = @"•";
    self.accessibilityValue = nil; // needed to preserve the empty accessibility state of the badge

    NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
    [attributesDictionary setObject:[UIFont fontWithName:@"Didot" size:24] forKey:NSFontAttributeName];
    [attributesDictionary setObject:color forKey:NSForegroundColorAttributeName];
    [self setBadgeTextAttributes:attributesDictionary forState:UIControlStateNormal];
}

- (void)bpk_removeDot {
    self.badgeColor = BPKColor.panjin;
    self.badgeValue = nil;
    [self setBadgeTextAttributes:nil forState:UIControlStateNormal];
}

@end
NS_ASSUME_NONNULL_END
