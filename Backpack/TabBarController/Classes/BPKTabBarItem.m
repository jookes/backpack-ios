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

#import "BPKTabBarItem.h"

#import <Backpack/Color.h>

NS_ASSUME_NONNULL_BEGIN
@interface BPKTabBarItem ()
@property(nonatomic, nullable, strong) UIColor *internalBadgeColor;
@property(nonatomic, nullable, strong) NSString *internalBadgeValue;
@property(nonatomic, nullable, strong) UIImage *internalImage;
@end


@implementation BPKTabBarItem

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype _Nullable)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    self.badgeColor = BPKColor.panjin;
}

- (void)setImage:(UIImage *_Nullable)image {
    self.internalImage = image;

    [self updateAppearance];
}

- (void)setBadgeColor:(UIColor *_Nullable)badgeColor {
    self.internalBadgeColor = badgeColor;

    [self updateAppearance];
}

- (void)setBadgeValue:(NSString *_Nullable)badgeValue {
    self.internalBadgeValue = badgeValue;

    [self updateAppearance];
}

-(UIImage * _Nullable)tabImageWithDot:(UIImage * _Nullable)image dotColor:(UIColor * _Nullable)dotColor {
    // Cache image + dotColor + appearance so that we don't need to repeat this?
    
}

- (void)updateAppearance {
    if(self.internalBadgeValue == nil || ![self.internalBadgeValue isEqualToString:@""]) {
        [super setBadgeValue:self.internalBadgeValue];
        [super setBadgeColor:self.internalBadgeColor];
        [super setImage:self.internalImage];
        return;
    }

    // if badgeValue is "" then we need to work our magic
    [super setBadgeValue:self.internalBadgeValue];
    [super setBadgeColor:BPKColor.clear];
    [super setImage:[self tabImageWithDot:self.internalImage]]; // calculate image with dot
}

// TODO When appearance changes, call updateAppearance

@end

NS_ASSUME_NONNULL_END
