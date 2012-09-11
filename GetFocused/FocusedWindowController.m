//
//  FocusedWindowController.m
//  GetFocused
//
//  Created by Steve Derico on 9/8/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "Website.h"
#import "FocusedWindowController.h"

@interface FocusedWindowController () {
    NSUserDefaults *prefs;
}
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
        
        prefs = [NSUserDefaults standardUserDefaults];
        if ([prefs valueForKey:@"items"]!= nil) {
            
//            NSData *data = [prefs valueForKey:@"items"];
//            self.items = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }else{
            Website *fb = [[Website alloc] init];
            fb.websiteURL = @"http://www.facebook.com";
            self.items = [NSArray arrayWithObjects:fb, nil];
        }

        self.arrayController = [[NSArrayController alloc] init];
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
    NSLog(@"%@",self.items);
////    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.items];
//    [prefs setValue:self.items forKey:@"items"];
//    [prefs synchronize];
    
}

- (IBAction)addButton:(id)sender {
}

- (IBAction)removeButton:(id)sender {
}
@end
