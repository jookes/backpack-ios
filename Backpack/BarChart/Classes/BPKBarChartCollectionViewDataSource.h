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
@protocol BPKBarChartCollectionViewDelegate

/**
 * Called when a user selects a specfic bar
 *
 * @param barChart The BPKBarChartCollectionView on which selection has been performed
 * @param index The index of the selected bar
 */
- (void)barChart:(BPKBarChartCollectionView *)barChart selectedAtIndex:(Int)index;

@end
NS_ASSUME_NONNULL_END
