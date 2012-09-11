//
//  AppDelegate.m
//  GetFocused
//
//  Created by Steve Derico on 9/8/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "FocusedWindowController.h"
#import "AppDelegate.h"

@implementation AppDelegate
@synthesize statusMenu;


- (void)awakeFromNib{

    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
    [statusItem setTitle:@"GetFocused"];
    [statusItem setHighlightMode:YES];
    
}

#pragma mark - NSMenu


- (IBAction)startClicked:(id)sender {
}

- (IBAction)preferencesClicked:(id)sender {
    
    fwc = [[FocusedWindowController alloc] initWithWindowNibName:@"FocusedWindowController"];
    [fwc.window makeKeyAndOrderFront:nil];
    [fwc showWindow:nil];
    
}

- (IBAction)quitClicked:(id)sender {
}
@end
