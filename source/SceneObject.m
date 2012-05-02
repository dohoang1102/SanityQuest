//
//  SceneObject.m
//  SanityQuest
//
//  Created by Developer on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneObject.h"


@interface SceneObject ()

@property (nonatomic) ObjectType objectType;
@property (nonatomic, strong) NSArray *sprites;

@end


@implementation SceneObject

@synthesize

objectType  = _objectType,
sprites     = _sprites,
spriteView  = _spriteView,
isWalking   = _isWalking,
destination = _destination;


- (id)initWithObjectType:(ObjectType)objectType {
  
  if (!(self = [super init])) { return nil; }
  
  self.objectType = objectType;
  
  self.sprites =
  [NSArray arrayWithObjects:
   [UIImage imageNamed:@"red-0-0.png"],
   [UIImage imageNamed:@"red-0-1.png"],
   [UIImage imageNamed:@"red-0-2.png"],
   nil];
  
  self.spriteView = [[UIImageView alloc] initWithImage:[self.sprites objectAtIndex:0]];

  return self;
}



- (void)animateWithIndex:(int)animationIndex {
  
  if (self.isWalking) {
    
    int spriteIndex = animationIndex % self.sprites.count;
    
    self.spriteView.image = [self.sprites objectAtIndex:spriteIndex];
    
    CGPoint c = self.spriteView.center;
    
    CGFloat dx = self.destination.x - c.x;
    CGFloat dy = self.destination.y - c.y;
    
    CGFloat adx = ABS(dx);
    CGFloat ady = ABS(dy);
    
    if (adx >= ady) {
      if (dx > 0) c.x += 1;
      if (dx < 0) c.x -= 1;
    }
    else {
      if (dy > 0) c.y += 1;
      if (dy < 0) c.y -= 1;
    }
    
    if (adx < 1 && ady < 1) {
      c = self.destination;
      self.isWalking = NO;
    }
    
    self.spriteView.center = c;
  }
}


@end
