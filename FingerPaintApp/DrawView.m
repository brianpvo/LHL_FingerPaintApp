//
//  DrawView.m
//  FingerPaintApp
//
//  Created by Brian Vo on 2018-04-20.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView ()

@property (nonatomic) NSMutableArray *linesArray;

@end

@implementation DrawView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _linesArray = [NSMutableArray new];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor yellowColor] setStroke];
    
    NSLog(@"%@", [self.linesArray lastObject]);
    
    for (Line *line in self.linesArray) {
        
        [path moveToPoint:line.firstPoint];
        
        [path addLineToPoint:line.nextPoint];
    }
    [path stroke];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];

    CGPoint firstPoint = [touch locationInView:self];
    Line *line = [[Line alloc] initWithPoints:firstPoint
                                             :firstPoint];
    [self.linesArray addObject:line];
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    Line* line = [[Line alloc] initWithPoints:previousPoint
                                             :currentPoint];
    
    [self.linesArray addObject:line];
    
    [self setNeedsDisplay];
}


@end
