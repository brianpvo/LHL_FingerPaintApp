//
//  Line.h
//  FingerPaintApp
//
//  Created by Brian Vo on 2018-04-20.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Line : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint nextPoint;

-(instancetype)initWithPoints:(CGPoint)firstPoint :(CGPoint)nextPoint;

@end
