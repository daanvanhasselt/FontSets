//
//  FSDocument.m
//  FontSets
//
//  Created by Daan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSDocument.h"
#import "FSFont.h"

@implementation FSDocument
@synthesize fonts;
@synthesize prefix;
@synthesize projectDir;
@synthesize arrayController;
@synthesize tableView;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
        self.fonts = [[NSMutableArray alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(textDidChange:)
                   name:NSTextDidEndEditingNotification
                 object:self.tableView];
    }
    return self;
}

- (IBAction)selectProjectDir:(id)sender{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setTitle:@"Select a project directory"];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        self.projectDir =  [[openPanel directoryURL] path];
    }];

}

- (IBAction)exportHeader:(id)sender{
    if(self.projectDir == nil){
        NSOpenPanel *openPanel = [NSOpenPanel openPanel];
        [openPanel setCanChooseDirectories:YES];
        [openPanel setCanChooseFiles:NO];
        [openPanel beginWithCompletionHandler:^(NSInteger result) {
            self.projectDir =  [[openPanel directoryURL] path];
        }];
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        while(self.projectDir == nil){}
        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSString *path = [[NSBundle mainBundle] pathForResource:@"script" ofType:@"sh"];
//            NSString *bash = [NSString stringWithFormat: @"sh %@ %@ AAA BBB", path, self.projectDir];
//            system([bash cStringUsingEncoding:NSUTF8StringEncoding]);
        });
    });
}

- (void)insertRow:(id)sender{
    [self.arrayController insert:sender];
//    NSLog(@"%@", [[self.arrayController arrangedObjects] objectAtIndex:[self.arrayController selectionIndex]]);
}

- (void)removeRow:(id)sender{
    [self.arrayController remove:sender];
}

- (void)textDidChange:(NSNotification *)aNotification
{
    FSFont *font = [self.fonts objectAtIndex:[self.tableView selectedRow]];
    [font generateName];
}

- (IBAction)selectionDidChange:(id)sender{
    [self textDidChange:nil];
}

- (NSString *)windowNibName
{
    return @"FSDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:fonts];
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.fonts = [array mutableCopy];
    return YES;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
