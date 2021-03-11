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

#import "BPKMapAnnotationView.h"

#import <Backpack/Color.h>
#import <Backpack/Spacing.h>

#import "BPKMapAnnotationViewCalloutView.h"
#import "BPKMapAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPKMapAnnotationView()
@property(nonatomic, nullable, readonly) BPKMapAnnotation *bpk_annotation;
@property(nonatomic, strong) BPKMapAnnotationViewCalloutView *calloutView;

@end

@implementation BPKMapAnnotationView

- (instancetype)initWithAnnotation:(id<MKAnnotation> _Nullable)annotation reuseIdentifier:(NSString * _Nullable)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];

    if (self) {
        [self setupAppearance];
    }

    return self;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        [self setupAppearance];
    }

    return self;
}

-(BPKMapAnnotation *_Nullable)bpk_annotation {
    if(self.annotation == nil) {
        return nil;
    }

    if(![self.annotation isKindOfClass:BPKMapAnnotation.class]) {
        NSAssert(false, @"BPKMapAnnotationView should be initialised with an instance of BPKMapAnnotation. Instead annotation class is %@", self.annotation.class);
        return nil;
    }

    return (BPKMapAnnotation *)self.annotation;
}

-(void)setupAppearance {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.hasBeenSelected = false;
    [self updateImage];

    self.calloutView = [[BPKMapAnnotationViewCalloutView alloc] initWithAnnotationView:self];
    self.calloutView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.calloutView];

    [NSLayoutConstraint activateConstraints:@[
        [self.calloutView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.calloutView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.trailingAnchor constraintEqualToAnchor:self.calloutView.trailingAnchor],
        [self.bottomAnchor constraintEqualToAnchor:self.calloutView.bottomAnchor]
    ]];
    
    [self updateAppearance];
}

-(void)updateImage {
    self.image = nil;
}

- (void)setSelected:(BOOL)selected {
    [self setSelected:selected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.hasBeenSelected = self.hasBeenSelected || selected;
    [self updateAppearance];
}

- (void)setAnnotation:(id<MKAnnotation> _Nullable)annotation {
    [super setAnnotation:annotation];

    [self updateAppearance];
}

-(void)updateAccessibilityProperties {
    self.accessibilityLabel = self.bpk_annotation.accessibilityLabel;
    self.accessibilityValue = self.bpk_annotation.accessibilityValue;
    self.accessibilityHint = self.bpk_annotation.accessibilityHint;
}

-(void)updateAppearance {
    [self updateAccessibilityProperties];
    self.enabled = self.bpk_annotation.enabled;
    [self.calloutView update];
}

- (void)traitCollectionDidChange:(UITraitCollection * _Nullable)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    if (self.traitCollection.userInterfaceStyle != previousTraitCollection.userInterfaceStyle) {
        [self updateImage];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.hasBeenSelected = false;
}

@end
NS_ASSUME_NONNULL_END
