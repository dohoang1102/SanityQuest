//
//  ViewController.m
//  Grids
//
//  Created by Family on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SceneObject.h"
#import "Hero.h"


@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) NSMutableSet *sceneObjects;

@property (nonatomic, strong) SceneObject *hero;

@end


@implementation ViewController

@synthesize

displayLink   = _displayLink,
sceneObjects  = _sceneObjects,
hero          = _hero;



- (void)updateDestination:(NSSet *)touches {  
  self.hero.isWalking = (touches.count == 1);
  if (self.hero.isWalking) {
    self.hero.destination = [touches.anyObject locationInView:self.view];
  }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self updateDestination:touches];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  [self updateDestination:touches];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  
}


- (void)loadView {
  
  self.view = [[UIView alloc] initWithFrame:CGRectZero];
  self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
  
  [self.view addSubview:backgroundView];
  
  self.sceneObjects = [NSMutableSet new];
  
  // hero
  
  self.hero = [Hero new];
  [self.sceneObjects addObject:self.hero];
  
  
  // goblin
  
  SceneObject *goblin = [SceneObject new];
  [self.sceneObjects addObject:goblin];
  
  for (SceneObject *o in self.sceneObjects) {
    [self.view addSubview:o.spriteView];
  }
  
  self.hero.position = CGPointMake(160, 230);
  goblin.position = CGPointMake(30, 30);
  
  // create the display link timer that will drive all animations
  self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animate:)];
  [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];  
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}


- (void)animate:(CADisplayLink *)displayLink {
    
  for (SceneObject *o in self.sceneObjects) {
    if (o != self.hero) {
      o.isWalking = YES;
      o.destination = self.hero.spriteView.center;
    }
    
    [o animateWithTimestamp:displayLink.timestamp];
  }
}


@end
