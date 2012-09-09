//
//  FocusedWindowController.h
//  GetFocused
//
//  Created by Steve Derico on 9/8/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FocusedWindowController : NSWindowController
@property (strong) IBOutlet NSPopUpButton *durationPopUp;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic, strong) NSArrayController *arrayController;
@property (strong) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) NSArray *items;
- (IBAction)getFocusedClicked:(id)sender;
- (IBAction)addButton:(id)sender;
- (IBAction)removeButton:(id)sender;

@end
