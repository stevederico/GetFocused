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
@synthesize panelController = _panelController;
@synthesize menubarController = _menubarController;

    //    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    //    [statusItem setMenu:statusMenu];
    //    [statusItem setTitle:@"GetFocused"];
    //    [statusItem setHighlightMode:YES];

void *kContextActivePanel = &kContextActivePanel;

- (void)awakeFromNib{
        
    Website *fb = [[Website alloc] init];
    [fb setWebsiteURL:@"http://www.facebook.com"];
    
    self.panelController.items = [[NSArray alloc] initWithObjects:fb, nil];
//    self.panelController.delegate  = self;
    
}

#pragma mark - NSMenu


- (IBAction)startClicked:(id)sender {
        //Write to HostFile
}

- (IBAction)preferencesClicked:(id)sender {
    
    
}

- (IBAction)quitClicked:(id)sender {
    //save array
    [[NSApplication sharedApplication] terminate:nil];
    
}

#pragma mark - App Delegate

- (void)dealloc {
    [_panelController removeObserver:self forKeyPath:@"hasActivePanel"];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == kContextActivePanel) {
        self.menubarController.hasActiveIcon = self.panelController.hasActivePanel;
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
        // Install icon into the menu bar
    self.menubarController = [[MenubarController alloc] init];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
        // Explicitly remove the icon from the menu bar
    self.menubarController = nil;
    return NSTerminateNow;
}

#pragma mark - Actions

- (IBAction)togglePanel:(id)sender {
    self.menubarController.hasActiveIcon = !self.menubarController.hasActiveIcon;
    self.panelController.hasActivePanel = self.menubarController.hasActiveIcon;
}

#pragma mark - Public accessors

- (PanelController *)panelController {
    if (_panelController == nil) {
        _panelController = [[PanelController alloc] initWithDelegate:self];
        [_panelController addObserver:self forKeyPath:@"hasActivePanel" options:0 context:kContextActivePanel];
    }
    return _panelController;
}

#pragma mark - PanelControllerDelegate

- (StatusItemView *)statusItemViewForPanelController:(PanelController *)controller {
    return self.menubarController.statusItemView;
}

@end
