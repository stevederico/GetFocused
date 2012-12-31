//
//  AppDelegate.h
//  GetFocused
//
//  Created by Steve Derico on 9/8/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "MenubarController.h"
#import "PanelController.h"
#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSMenuDelegate, PanelControllerDelegate>

@property (nonatomic, strong) IBOutlet NSMenu *statusMenu;
@property (nonatomic, strong) MenubarController *menubarController;
@property (nonatomic, strong, readonly) PanelController *panelController;

@end
