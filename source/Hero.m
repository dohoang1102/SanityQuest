//
//  Hero.m
//  SanityQuest
//
//  Created by Developer on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (CGFloat)maxSpeed {
  return 2.5;
}


- (NSArray *)makeSpriteNames {

  return [NSArray arrayWithObjects:
          @"red-0-0.png",
          @"red-0-1.png",
          @"red-0-2.png",
          nil];
}


@end
