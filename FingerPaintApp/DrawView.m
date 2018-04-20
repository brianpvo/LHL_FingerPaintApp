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
@property (nonatomic) CGFloat strokeWidth;
@property (nonatomic) NSTimeInterval previousTimestamp;
@property (nonatomic) CGPoint firstPoint;

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
    path.lineWidth = self.strokeWidth;
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

    self.firstPoint = [touch locationInView:self];
    Line *line = [[Line alloc] initWithPoints:self.firstPoint
                                             :self.firstPoint];
    [self.linesArray addObject:line];
    
    self.previousTimestamp = event.timestamp;
    self.strokeWidth = 1;
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    Line* line = [[Line alloc] initWithPoints:previousPoint
                                             :currentPoint];
    
    [self.linesArray addObject:line];
    
    if (fabs(currentPoint.x - self.firstPoint.x) > 100 || fabs(currentPoint.y - self.firstPoint.y) > 100) {
        self.strokeWidth++;
    }
    
    [self setNeedsDisplay];
}


@end
