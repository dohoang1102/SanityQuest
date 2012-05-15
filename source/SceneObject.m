//
//  SceneObject.m
//  SanityQuest
//
//  Created by Developer on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneObject.h"
#import "CG_utils.h"

@interface SceneObject ()

@property (nonatomic, strong) NSArray *sprites;

@end


@implementation SceneObject

@synthesize

spriteView  = _spriteView,
isWalking   = _isWalking,
position    = _position,
destination = _destination,

sprites     = _sprites;




- (id)init {
  
  if (!(self = [super init])) { return nil; }
    
  self.sprites =
  [NSArray arrayWithObjects:
   [UIImage imageNamed:@"red-0-0.png"],
   [UIImage imageNamed:@"red-0-1.png"],
   [UIImage imageNamed:@"red-0-2.png"],
   nil];
  
  self.spriteView = [[UIImageView alloc] initWithImage:[self.sprites objectAtIndex:0]];

  return self;
}


- (CGFloat)maxSpeed {
  return 1;
}


- (void)animateWithTimestamp:(NSTimeInterval)timestamp {
  
  CGPoint p = self.position;

  if (self.isWalking) {
    
    // update sprite
    
    float animationRate = 3; // how many times per second we cycle the sprite
    int animationIndex = timestamp * animationRate;

    int spriteIndex = animationIndex % self.sprites.count;
    
    self.spriteView.image = [self.sprites objectAtIndex:spriteIndex];
    
    // update position
    
    
    CGFloat dx = self.destination.x - p.x;
    CGFloat dy = self.destination.y - p.y;
    
    if (ABS(dx) < 1 && ABS(dy) < 1) {
      self.position = self.destination; // force object to final destination
      self.isWalking = NO;
    }
    
    else {
      CGFloat mag = sqrt(dx * dx + dy * dy);
      
      CGFloat m = self.maxSpeed / mag;
      
      p.x += dx * m;
      p.y += dy * m;
      
      self.position = p;
    }    
  }
  // make sprite view center on integral coordinates
  self.spriteView.center = CGPointSnap(p);
}


@end
