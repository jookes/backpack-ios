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

NS_ASSUME_NONNULL_BEGIN

/**
 * `BPKBarChartBar` is a subclass of `UIControl` configured with Skyscanner barchart bar style.
 */
@interface BPKBarChartBar : UIControl

/// The relative value of the bar between 0.0 and 1.0. This determines how "full" the bar will appear.
@property(nonatomic, nullable) NSNumber *fillValue;

/// The actual value associated with the bar.
/// This is the value shown in the flare when the bar is selected.
@property(nonatomic, nullable, weak) NSString *valueDescription;

/// The title to show below the bar
@property(nonatomic, weak) NSString *title;

/// The subtitle to show below the title
@property(nonatomic, weak) NSString *subtitle;

/// The absolute position of the top of the bar view
@property(nonatomic, readonly) CGFloat barTopPosition;

@end
NS_ASSUME_NONNULL_END
