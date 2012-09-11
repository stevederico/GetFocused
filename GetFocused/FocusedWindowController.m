//
//  FocusedWindowController.m
//  GetFocused
//
//  Created by Steve Derico on 9/8/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import "FocusedWindowController.h"

@interface FocusedWindowController () 

@end

@implementation FocusedWindowController
@synthesize tableView;
@synthesize durationPopUp;
@synthesize timer;
@synthesize arrayController;
@synthesize items;

- (id)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        self.arrayController = [[NSArrayController alloc] init];
        NSMutableDictionary *fb = [[NSMutableDictionary alloc] init];
        [fb setValue:@"Facebook" forKey:@"Name"];
        [fb setValue:@"http://www.facebook.com" forKey:@"URL"];
        [fb setValue:[NSNumber numberWithBool:YES] forKey:@"Status"];
        self.items = [NSArray arrayWithObject:fb];
        self.arrayController.content = self.items;
    }
    
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self.durationPopUp removeAllItems];
    [self.durationPopUp addItemsWithTitles:[NSArray arrayWithObjects:@"30 Minutes",@"60 Minutes",@"90 Minutes", nil]];
}

- (IBAction)getFocusedClicked:(id)sender {
}

- (IBAction)addButton:(id)sender {
}

- (IBAction)removeButton:(id)sender {
}
@end
