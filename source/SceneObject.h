//
//  SceneObject.h
//  SanityQuest
//
//  Created by Developer on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SceneObject : NSObject

@property (nonatomic, strong) UIImageView *spriteView;
@property (nonatomic) BOOL isWalking;
@property (nonatomic) CGPoint position;
@property (nonatomic) CGPoint destination;

- (void)animateWithTimestamp:(NSTimeInterval)timestamp;

@end
