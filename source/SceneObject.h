//
//  SceneObject.h
//  SanityQuest
//
//  Created by Developer on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  ObjectTypeUnknown = 0,
  ObjectTypeHero,
  ObjectTypeGoblin,
} ObjectType;


@interface SceneObject : NSObject

@property (nonatomic, strong) UIImageView *spriteView;
@property (nonatomic) BOOL isWalking;
@property (nonatomic) CGPoint destination;

- (id)initWithObjectType:(ObjectType)objectType;
- (void)animateWithIndex:(int)animationIndex;

@end
