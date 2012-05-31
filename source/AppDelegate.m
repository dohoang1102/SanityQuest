//
//  AppDelegate.m
//  Grids
//
//  Created by Family on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"


@implementation AppDelegate

@synthesize
window          = _window,
viewController  = _viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [ViewController new];
  
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    
  }
  else {
    
  }
  
  return YES;
}


@end
