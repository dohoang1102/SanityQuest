//
//  Troll.m
//  SanityQuest
//
//  Created by Developer on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Troll.h"

@implementation Troll


- (CGFloat)maxSpeed {
  return 2;
}


- (NSArray *)makeSpriteNames {
  
  return [NSArray arrayWithObjects:
          @"goblin-0-0.png",
          @"goblin-0-1.png",
          @"goblin-0-2.png", 
          nil];
}



@end
