//
//  CG_utils.m
//  SanityQuest
//
//  Created by Developer on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CG_utils.h"


BOOL CGPointsAreClose(CGPoint p, CGPoint q) {
  
  CGFloat dx = q.x - p.x;
  CGFloat dy = q.y - p.y;
  
  return (ABS(dx) < 1 && ABS(dy) < 1);
}


CGPoint CGPointSnap(CGPoint p) {

  return CGPointMake(roundf(p.x), roundf(p.y));
}

