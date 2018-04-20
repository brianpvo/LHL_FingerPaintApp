//
//  Line.m
//  FingerPaintApp
//
//  Created by Brian Vo on 2018-04-20.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithPoints:(CGPoint)firstPoint :(CGPoint)nextPoint
{
    self = [super init];
    if (self) {
        _firstPoint = firstPoint;
        _nextPoint = nextPoint;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ -> %@", NSStringFromCGPoint(self.firstPoint), NSStringFromCGPoint(self.nextPoint)];
}

@end
