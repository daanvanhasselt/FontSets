//
//  FSDocument.h
//  FontSets
//
//  Created by Daan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FSDocument : NSDocument <NSTableViewDelegate>

- (IBAction)exportHeader:(id)sender;
- (IBAction)selectProjectDir:(id)sender;

- (IBAction)insertRow:(id)sender;
- (IBAction)removeRow:(id)sender;

- (IBAction)selectionDidChange:(id)sender;

@property (strong) IBOutlet NSMutableArray *fonts;
@property (strong) IBOutlet NSArrayController *arrayController;
@property (strong) IBOutlet NSTableView *tableView;

@property (strong) NSString *prefix;
@property (strong) NSString *projectDir;



@end
