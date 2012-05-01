//
//  ViewController.m
//  Grids
//
//  Created by Family on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *sprites;
@property (nonatomic, strong) UIImageView *spriteView;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic) BOOL isWalking;
@property (nonatomic) CGPoint destination;

@end


@implementation ViewController

@synthesize
sprites     = _sprites,
spriteView  = _spriteView,
displayLink = _displayLink,
isWalking   = _isWalking,
destination = _destination;



- (void)updateDestination:(NSSet *)touches {  
  self.isWalking = (touches.count == 1);
  if (self.isWalking) {
    self.destination = [touches.anyObject locationInView:self.view];
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
  
  self.sprites =
  [NSArray arrayWithObjects:
   [UIImage imageNamed:@"red-0-0.png"],
   [UIImage imageNamed:@"red-0-1.png"],
   [UIImage imageNamed:@"red-0-2.png"],
   nil];
  
  self.spriteView = [[UIImageView alloc] initWithImage:[self.sprites objectAtIndex:0]];
  
  [self.view addSubview:self.spriteView];
  self.spriteView.center = CGPointMake(160, 230);
  
  // create the display link timer that will drive all animations
  self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animate:)];
  [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];  
}


- (void)viewDidLoad {
  [super viewDidLoad];
}


- (void)viewDidUnload {
  [super viewDidUnload];
  self.spriteView = nil;
  self.sprites = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}


- (void)animate:(CADisplayLink *)displayLink {
  
  float rate = 3;
  int time = [NSDate timeIntervalSinceReferenceDate] * rate;
  
  
  //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Test.png"]];
  
  
  if (self.isWalking) {
    int spriteIndex = time % self.sprites.count;
  
    self.spriteView.image = [self.sprites objectAtIndex:spriteIndex];
    
    // TODO: move the spriteView in the direction of the destination at a constant rate
    // may require some math. think about the pythagorean theorem
    // for now, will just walk in the x and y directions independently
    
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
