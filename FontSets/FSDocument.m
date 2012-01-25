//
//  FSDocument.m
//  FontSets
//
//  Created by Daan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSDocument.h"

@implementation FSDocument
@synthesize fonts;
@synthesize prefix;
@synthesize projectDir;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
        self.fonts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)selectProjectDir:(id)sender{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        self.projectDir =  [[openPanel directoryURL] path];
    }];

}

- (IBAction)exportHeader:(id)sender{
    if(self.projectDir == nil){
        NSLog(@"Please set a projectdir");

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
//            NSString *bash = [NSString stringWithFormat:@"mkdir ~/%@/.fontsset_backup", self.projectDir];
            NSString *bash = [NSString stringWithFormat:@"mkdir ~/%@/.fontsset_backup;", self.projectDir];
            system([bash cStringUsingEncoding:NSUTF8StringEncoding]);
            bash = [NSString stringWithFormat:@"echo "];
        });
    });
//    NSFileManager *fileManager = [NSFileManager defaultManager];
////    NSString *documentsDir = @"~/Library/Application Support/FontSets";
//    NSString *documentsDir = @"~/Desktop";
//    NSString *path = [NSString stringWithFormat:@"%@/backup/test", documentsDir];
//    NSError *error = nil;
//    BOOL success = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
//    NSLog(@"%i: %@ %@", success, error, path);
//    NSString *documentsDir = @"~/Library/Application Support/FontSets";
//    NSString *bash = [NSString stringWithFormat:@"mkdir -p %@/backup", documentsDir];
//    system([bash cStringUsingEncoding:NSUTF8StringEncoding]);
//    NSLog(@"make backup dir: %@", bash);
//    NSLog(@"show dialog to select path to save header file");
//    NSLog(@"generate header according to array: %@", self.fonts);
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

-(void)filePanelDidEnd:(NSWindow*)sheet
            returnCode:(int)returnCode
           contextInfo:(void*)contextInfo{
    NSLog(@"did end");
}

- (void)panel:(id)sender didChangeToDirectoryURL:(NSURL *)url{
    NSLog(@"panel changed to url: %@", url);
}

- (BOOL)panel:(id)sender shouldEnableURL:(NSURL *)url{
    NSLog(@"should enable: %@", url);
    return YES;
}

- (NSString *)panel:(id)sender userEnteredFilename:(NSString *)filename confirmed:(BOOL)okFlag{
    NSLog(@"entered filename %@", filename);
    return filename;
}

- (BOOL)panel:(id)sender validateURL:(NSURL *)url error:(NSError **)outError{
    NSLog(@"validate: %@", url);
    return YES;
}

@end
